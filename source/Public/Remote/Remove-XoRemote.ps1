function Remove-XoRemote
{
    <#
    .SYNOPSIS
    Remove Remote

    .DESCRIPTION
    Remove Remote

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Id

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Remove-XoRemote -Session $sess -Id "8054b336-3c07-4f6f-8b0a-3e8ccdb8c454"

    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string]
        $Id
    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Remove Remote"))
        {


            $params = @{
                id = $Id
            }

            try
            {
                $body = New-JsonRpcRequest -Method "remote.delete" -Params $params
                $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }

            if (-not ($resp.result))
            {
                throw "Failed to remove the Remote $($Id)"
            }
        }

    }

    end
    {
        # return $result
    }
}
