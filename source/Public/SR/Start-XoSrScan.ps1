function Start-XoSrScan
{
    <#
    .SYNOPSIS
    Start a Scan on target SR

    .DESCRIPTION
    Start a Scan on target SR

    .PARAMETER Session
    XoSession

    .PARAMETER Id
    Target SR Id

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Start-XoSrScan -Session $sess -Id "a933cb47-fbf7-42a5-af39-abac9fc3feca"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "low")]
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
        if ($PSCmdlet.ShouldProcess($Id, "Start a Scan on target SR"))
        {


            $params = @{
                id = $Id
            }

            try
            {
                $body = New-JsonRpcRequest -Method "sr.scan" -Params $params
                $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop

            }
            catch
            {
                throw $_.Exception.Message
            }
            if ($resp)
            {
                $prop = $resp.params.items.psobject.Properties.Value | Where-Object { $_.name_label -ilike "Async.SR.scan" }

            }
            $null = Get-XoTaskProgress -Session $Session -Id $prop.id

        }

    }

    end
    {
    }
}
