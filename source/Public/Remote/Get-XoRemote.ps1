function Get-XoRemote
{
    <#
    .SYNOPSIS
    Get Remotes

    .DESCRIPTION
    Get Remotes

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Remote Id

    .PARAMETER Name
    Target Name

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoRemote -Session $sess

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoRemote -Session $sess -Name "MyRemote"
    #>
    [CmdletBinding(DefaultParameterSetName = "Default")]
    [OutputType([XoRemote])]
    param (
        [Parameter(ParameterSetName = "Default")]
        [Parameter(ParameterSetName = "Id")]
        [Parameter(ParameterSetName = "Name")]
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ParameterSetName = "Id")]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id,

        [Parameter(ParameterSetName = "Name")]
        [string]
        $Name

    )

    begin
    {

    }

    process
    {

        $params = @{}

        if ($PSBoundParameters.ContainsKey("Id"))
        {
            $params["id"] = $Id
            try
            {
                $body = New-JsonRpcRequest -Method "remote.get" -Params $params
                $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }
        }
        else
        {

            try
            {
                $body = New-JsonRpcRequest -Method "remote.getAll" -Params $params
                $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }
        }



        if ($null -ne $resp)
        {
            $items = [pscustomobject]$resp.result


            if ($PSBoundParameters.ContainsKey("Name"))
            {
                $items = @($items | Where-Object { $_.name -ilike "*$($Name)*" })
            }
            foreach ($item in $items)
            {

                [XoRemote]::new(@{
                        Id         = $item.Id
                        Name       = $item.name
                        Url        = $item.url
                        Enabled    = $item.enabled
                        Benchmarks = $item.benchmarks
                    })
            }
        }

    }

    end
    {
        # return $result
    }
}
