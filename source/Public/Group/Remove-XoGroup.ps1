function Remove-XoGroup
{
    <#
    .SYNOPSIS
    Removes an existing group

    .DESCRIPTION
    Removes an existing group

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Host ID

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Remove-XoGroup -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
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
        $Id
    )

    begin
    {



    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Removes an existing group"))
        {
            $params = @{
                id = $Id
            }

            try
            {
                $body = New-JsonRpcRequest -Method "group.delete" -Params $params
                $null = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
                # return $resp
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
