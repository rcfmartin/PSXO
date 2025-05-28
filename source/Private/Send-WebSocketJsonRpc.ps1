function Send-WebSocketJsonRpc
{
    <#
    .SYNOPSIS
    Send json-rpc via web socket

    .DESCRIPTION
    Send json-rpc via web socket

    .PARAMETER Session
    XoSession object

    .PARAMETER Body
    Json-rpc body string

    .EXAMPLE
    $body = New-JsonRpcRequest -Method "vm.start" -Param @{id = 9ace51e1-dfbd-4617-8db3-88f28974e111}
    Send-WebSocketJsonRpc -Session $Session -Body $body
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]$Session,

        [Parameter(Mandatory = $true)]
        [string]
        $Body
    )

    begin
    {

        function Send-WebSocketRequest
        {
            [CmdletBinding()]
            param (
                [Parameter()]
                [ValidateNotNullOrEmpty()]
                [string]$Request
            )

            begin
            {
                $output = $null
            }

            process
            {
                # Convert request to bytes
                $requestBytes = [System.Text.Encoding]::UTF8.GetBytes($Request)
                $buffer = New-Object ArraySegment[byte] -ArgumentList @(, $requestBytes)

                # Send request
                $sendTask = $Script:ws.SendAsync($buffer, [System.Net.WebSockets.WebSocketMessageType]::Text, $true, $Script:ct.Token)
                $null = $sendTask.Wait(10 * 1000)

                # Receive response
                $receiveBuffer = New-Object byte[] 1024
                $receiveSegment = New-Object ArraySegment[byte] -ArgumentList @(, $receiveBuffer)
                $responseBuilder = New-Object System.Text.StringBuilder

                do
                {
                    $receiveTask = $Script:ws.ReceiveAsync($receiveSegment, $Script:ct.Token)
                    $null = $receiveTask.Wait()
                    $result = $receiveTask.Result

                    $receivedString = [System.Text.Encoding]::UTF8.GetString($receiveBuffer, 0, $result.Count)
                    $responseBuilder.Append($receivedString) | Out-Null
                } while (!$result.EndOfMessage)

                $response = $responseBuilder.ToString()
                if ($response)
                {
                    try
                    {
                        $output = [pscustomobject]$($response | ConvertFrom-Json -Depth 99 -ErrorAction Stop)
                    }
                    catch
                    {
                        $output = [pscustomobject]$($response | ConvertFrom-Json -Depth 99 -AsHashtable)
                    }
                }

                return $output
            }

            end
            {

            }
        }

        $Token = $Session.Session.Cookies.GetAllCookies().Value

        # Just replacing http and not https. If https, the final result will be wss.
        $Uri = "$($Session.Uri -ireplace 'http', 'ws' -replace '\/$','')/api/"
    }

    process
    {
        try
        {
            # Create WebSocket client
            $Script:ws = New-Object System.Net.WebSockets.ClientWebSocket
            $Script:ct = New-Object System.Threading.CancellationTokenSource

            # Connect to WebSocket server
            Write-Verbose "Connecting to $Uri..."
            $connectTask = $Script:ws.ConnectAsync([System.Uri]$Uri, $Script:ct.Token)
            $null = $connectTask.Wait(10 * 1000)

            if ($Script:ws.State -ne [System.Net.WebSockets.WebSocketState]::Open)
            {
                throw "Failed to connect to WebSocket"
            }

            # JSON-RPC request
            $request = New-JsonRpcRequest -Method "session.signInWithToken" -Params @{token = "$($Token)" }
            $isLoggedIn = Send-WebSocketRequest -Request $request
            if ($isLoggedIn.Error)
            {
                throw $isLoggedIn.Error.Message
            }
            $result = Send-WebSocketRequest -Request $Body

            if ($result.Error)
            {
                throw $result.Error.Message
            }

            # Close Session
            $null = $Script:ws.CloseAsync([System.Net.WebSockets.WebSocketCloseStatus]::NormalClosure, "Closing", $Script:ct.Token).Wait()
        }
        catch
        {
            throw $_.Exception.Message
        }
        finally
        {
            if ($Script:ws)
            {
                $null = $Script:ws.Dispose()
            }
            if ($Script:ct)
            {
                $null = $Script:ct.Dispose()
            }
        }

    }

    end
    {
        return $result
    }
}
