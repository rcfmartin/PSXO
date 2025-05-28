function Update-XoGroup
{
    <#
    .SYNOPSIS
    Updates the group Name

    .DESCRIPTION
    Updates the group Name

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target group Id

    .PARAMETER Name
    Target Group name

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Update-XoGroup -Session $Session -Name "MyNewGroupName"
    #>
    [CmdletBinding()]
    [OutputType([XoGroup])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $Id,

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
            id   = $Id
            name = $Name
        }


        try
        {
            $body = New-JsonRpcRequest -Method "group.set" -Params $params
            $null = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }

        try
        {
            $resp = Get-XoGroup -Session $Session -Id $Id -ErrorAction Stop
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
