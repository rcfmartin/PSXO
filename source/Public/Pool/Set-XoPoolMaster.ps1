function Set-XoPoolMaster
{
    <#
    .SYNOPSIS
    Set pool master

    .DESCRIPTION
    Set pool master

    .PARAMETER Session
    XoSession object

    .PARAMETER HostId
    Target Host ID

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Set-XoPoolMaster -Session $sess -HostId "9ace51e1-dfbd-4617-8db3-88f28974e111"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'high')]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $HostId
    )

    begin
    {



    }

    process
    {
        if ($PSCmdlet.ShouldProcess($HostId, "Set Pool Master"))
        {
            $params = @{
                host = $HostId
            }

            try
            {
                $body = New-JsonRpcRequest -Method "pool.setPoolMaster" -Params $params
                $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
                # return $resp
            }
            catch
            {
                throw $_.Exception.Message
            }
            if ($resp)
            {
                $prop = $resp.params.items.psobject.Properties.Value | Where-Object { $_.name_label -ilike "*pool.designate_new_master*" }
            }
            if ($prop)
            {
                $null = Get-XoTaskProgress -Session $Session -Id $prop.id
            }
            # if (-not $resp.result)
            # {
            #     throw $resp
            # }
        }

    }

    end
    {

    }
}
