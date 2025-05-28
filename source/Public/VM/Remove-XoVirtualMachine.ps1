function Remove-XoVirtualMachine
{
    <#
    .SYNOPSIS
    Delete virtual machine

    .DESCRIPTION
    Delete virtual machine

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Virtual machine ID

    .PARAMETER DeleteDisks
    Remove disks

    .PARAMETER Force
    Force deletion

    .PARAMETER ForceDeleteDefaultTemplate
    Delete default template

    .PARAMETER ForceBlockedOperation
    Force blocked operation

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Remove-XoVirtualMachine -Session $sess -Id "06754190-adbf-46a9-ab00-558ffcc9a22f" -DeleteDisks:$true
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    [OutputType([XoVirtualMachine])]
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
        $DeleteDisks,

        [Parameter()]
        [bool]
        $Force,

        [Parameter()]
        [bool]
        $ForceDeleteDefaultTemplate,

        [Parameter()]
        [bool]
        $ForceBlockedOperation


    )

    begin
    {

    }

    process
    {
        [hashtable]$params = @{
            id = $Id
        }

        if ($PSBoundParameters.ContainsKey("DeleteDisks"))
        {
            $params["deleteDisks"] = $DeleteDisks
        }
        if ($PSBoundParameters.ContainsKey("Force"))
        {
            $params["force"] = $Force
        }
        if ($PSBoundParameters.ContainsKey("ForceDeleteDefaultTemplate"))
        {
            $params["forceDeleteDefaultTemplate"] = $ForceDeleteDefaultTemplate
        }
        if ($PSBoundParameters.ContainsKey("ForceBlockedOperation"))
        {
            $params["forceBlockedOperation"] = $ForceBlockedOperation
        }
        if ($PSCmdlet.ShouldProcess("Delete VM", $Id))
        {
            try
            {
                $body = New-JsonRpcRequest -Method "vm.delete" -Params $params
                $null = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }
        }

    }

    end
    {

    }
}
