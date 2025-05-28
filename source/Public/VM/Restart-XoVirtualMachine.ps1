function Restart-XoVirtualMachine
{
    <#
    .SYNOPSIS
    Restarts the virtual Machine

    .DESCRIPTION
    Restarts the virtual Machine

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Virtual machine ID

    .PARAMETER Force
    Force Restart

    .PARAMETER BypassBlockedOperation
    Bypass blocked operation

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Restart-XoVirtualMachine -Session $sess -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
    #>
    [CmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $Id,

        [Parameter()]
        [bool]
        $Force = $false,

        [Parameter()]
        [bool]
        $BypassBlockedOperation = $false



    )

    begin
    {

    }

    process
    {
        [hashtable]$params = @{
            id = $Id
        }
        if ($PSBoundParameters.ContainsKey("Force"))
        {
            $params["force"] = $Force
        }
        if ($PSBoundParameters.ContainsKey("BypassBlockedOperation"))
        {
            $params["bypassBlockedOperation"] = $BypassBlockedOperation
        }
        try
        {
            $body = New-JsonRpcRequest -Method "vm.restart" -Params $params
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }
        if ($resp)
        {
            $prop = $resp.params.items.psobject.Properties.Value | Where-Object { $_.name_label -ilike "Async.VM.*reboot" }

        }
        $null = Get-XoTaskProgress -Session $Session -Id $prop.id

    }

    end
    {

    }
}
