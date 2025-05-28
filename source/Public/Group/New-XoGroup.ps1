function New-XoGroup
{
    <#
    .SYNOPSIS
    Creates a new group

    .DESCRIPTION
    Creates a new group

    .PARAMETER Session
    XoSession object

    .PARAMETER Name
    Target Group name

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    New-XoGroup -Session $sess -Name "MyGroup"
    #>
    [CmdletBinding()]
    [OutputType([XoGroup])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(Mandatory = $true)]
        [string]
        $Name
    )

    begin
    {

    }

    process
    {

        $params = @{
            name = $Name
        }


        try
        {
            $body = New-JsonRpcRequest -Method "group.create" -Params $params
            $null = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }


        try
        {
            $resp = Get-XoGroup -Session $Session -Name "$($Name)" -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }
        if ($null -ne $resp)
        {
            return $resp
        }

    }

    end
    {
        # return $result
    }
}
