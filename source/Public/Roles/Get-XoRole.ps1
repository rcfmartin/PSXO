function Get-XoRole
{
    <#
    .SYNOPSIS
    Get all Hosts

    .DESCRIPTION
    Get all Hosts

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Host ID

    .PARAMETER Name
    Target Host name

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoRole -Session $sess

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoRole -Session $sess -Name "MyVM"

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoRole -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
    #>
    [CmdletBinding()]
    [OutputType([XoRole])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session
    )

    begin
    {

        $params = @{}

    }

    process
    {

        try
        {
            $body = New-JsonRpcRequest -Method "role.getAll" -Params $params
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }

        if ($null -ne $resp)
        {
            $items = [pscustomobject]$resp.result
            foreach ($item in $items)
            {
                [XoRole]::new(@{
                        Id          = $item.id
                        Name        = $item.name
                        Permissions = $item.permissions
                    })
            }
        }

    }

    end
    {
        # return $result
    }
}
