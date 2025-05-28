function Get-XoHostMdadmHealth
{
    <#
    .SYNOPSIS
    retrieve the mdadm RAID health information

    .DESCRIPTION
    retrieve the mdadm RAID health information

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Host ID

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoHostMdadmHealth -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'low')]
    [OutputType([XoVirtualMachine])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $Id
    )

    begin
    {



    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "retrieve the mdadm RAID health information"))
        {
            $params = @{
                id = $Id
            }

            try
            {
                $body = New-JsonRpcRequest -Method "host.getMdadmHealth" -Params $params
                $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }
        }
        if ($resp.Error)
        {
            throw "Error occurred. $($resp.Error)"
        }
        return $resp

    }

    end
    {

    }
}
