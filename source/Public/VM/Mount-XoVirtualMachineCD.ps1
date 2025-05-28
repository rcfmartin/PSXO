function Mount-XoVirtualMachineCD
{
    <#
    .SYNOPSIS
    Mounts an ISO to the machine

    .DESCRIPTION
    Mounts an ISO to the machine

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Virtual machine ID

    .PARAMETER CdId
    Target ISO Id

    .PARAMETER Force
    Force mount

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Mount-XoVirtualMachineCD -Session $sess -Id "06754190-adbf-46a9-ab00-558ffcc9a22f" -CdId "19054190-adbf-46a9-ab00-558ffcc9a34f"
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

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $CdId,

        [Parameter()]
        [bool]
        $Force = $false
    )

    begin
    {

    }

    process
    {
        [hashtable]$params = @{
            id    = $Id
            cd_id = $CdId
        }
        if ($PSBoundParameters.ContainsKey("Force"))
        {
            $params["force"] = $Force
        }
        try
        {
            $body = New-JsonRpcRequest -Method "vm.insertCd" -Params $params
            $result = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }

    }

    end
    {
        if (-not $result)
        {
            throw "Failed to eject CD. Status: $($result)"
        }
    }
}
