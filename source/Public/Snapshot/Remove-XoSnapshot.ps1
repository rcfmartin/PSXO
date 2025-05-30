function Remove-XoSnapshot
{
    <#
    .SYNOPSIS
    Remove virtual machine snapshot

    .DESCRIPTION
    Remove virtual machine snapshot

    .PARAMETER Session
    XoSession object

    .PARAMETER SnapshotId
    Target snapshot ID

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Remove-XoSnapshot -Session $sess -SnapshotId "06754190-adbf-46a9-ab00-558ffcc9a22f"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $SnapshotId


    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($SnapshotId, "Remove Snapshot"))
        {

            [hashtable]$params = @{
                id = $SnapshotId
            }
            try
            {
                $vmExists = Get-XoVirtualMachine -Session $Session -Id $SnapshotId -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }

            if (-not($vmExists.Id))
            {
                throw "Snapshot was not found"
            }
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
        return
    }
}
