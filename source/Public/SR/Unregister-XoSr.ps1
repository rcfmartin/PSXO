function Unregister-XoSr
{
    <#
    .SYNOPSIS
    Forget SR

    .DESCRIPTION
    Forget SR

    .PARAMETER Session
    XoSession

    .PARAMETER Id
    Target SR Id

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Unregister-XoSr -Session $sess -Id "a933cb47-fbf7-42a5-af39-abac9fc3feca"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id
    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Forget SR"))
        {


            $params = @{
                id = $Id
            }

            try
            {
                $body = New-JsonRpcRequest -Method "sr.forget" -Params $params
                $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }

            if ($null -ne $resp)
            {
                if ($resp.result.error)
                {
                    throw $resp.result.error
                }
                $counter = 0
                do
                {

                    $sr = Get-XoSr -Session $Session -Id $Id
                    Start-Sleep -Seconds 6

                    if ($counter -gt 10)
                    {
                        do
                        {
                            Write-Warning "The process is taking too long to complete. Would you like do continue?(Y/N)"
                            [string]$ans = Read-Host
                        }
                        while ($ans -inotin @("y", "n"))
                        if ($ans -ieq "n")
                        {
                            return
                        }

                        $counter = 0
                        continue
                    }
                    $counter ++

                    $completed = [math]::Round(($counter / 10) * 100)
                    Write-Progress -Activity "Forgetting SR $($sr.NameLabel)" -Status "Checking status of the tasks" -PercentComplete $completed -Id 1
                }
                while ($null -ne $sr.Id)

                Write-Progress -Id 1 -Completed
            }
        }

    }

    end
    {
    }
}
