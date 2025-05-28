function Start-XoVirtualMachine
{
    <#
    .SYNOPSIS
    Start virtual machine

    .DESCRIPTION
    Start virtual machine

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Virtual machine ID

    .PARAMETER Force
    Force deletion

    .PARAMETER BypassMacAddressCheck
    Bypass MAC Adress check

    .PARAMETER HostId
    Target XCP-NG Host

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Start-XoVirtualMachine -Session $sess -Id "06754190-adbf-46a9-ab00-558ffcc9a22f" -HostId "1235a452-84c6-4191-af66-3bc6e484ae09"
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
        [string]
        $HostId,

        [Parameter()]
        [bool]
        $Force,

        [Parameter()]
        [bool]
        $BypassMacAddressCheck




    )

    begin
    {

    }

    process
    {
        [hashtable]$params = @{
            id = $Id
        }

        try
        {
            $vmExists = Get-XoVirtualMachine -Session $Session -Id $Id -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }
        if (-not($vmExists.Id))
        {
            throw "VM not found"
        }
        if ($PSBoundParameters.ContainsKey("Force"))
        {
            $params["force"] = $Force
        }
        if ($PSBoundParameters.ContainsKey("BypassMacAddressCheck"))
        {
            $params["BypassMacAddressCheck"] = $BypassMacAddressCheck
        }
        if ($PSBoundParameters.ContainsKey("HostId"))
        {
            $params["host"] = $HostId
        }
        try
        {
            $body = New-JsonRpcRequest -Method "vm.start" -Params $params
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }

        if ($result.Error)
        {
            throw $result.Error
        }


        if ($resp)
        {
            $prop = $resp.params.items.psobject.Properties.Value | Where-Object { $_.name_label -ilike "*VM.start*" }

        }
        $null = Get-XoTaskProgress -Session $Session -Id $prop.id
    }

    end
    {

    }
}
