function Remove-XoUser
{
    <#
    .SYNOPSIS
    Remove user

    .DESCRIPTION
    Remove User

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target user Id

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xoa.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Remove-XoUser -Session $sess -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"

    .NOTES
    General notes
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    [OutputType([XoUser])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [XoSession]$Session,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]$Id
    )

    begin
    {

    }

    process
    {
        $params = @{
            id = $Id
        }
        if ($PSCmdlet.ShouldProcess("Delete User", $Id))
        {
            try
            {
                $body = New-JsonRpcRequest -Method "user.delete" -Params $params
                $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }
        }


        if ($resp.Error)
        {
            throw $resp.Error
        }
    }

    end
    {

    }
}
