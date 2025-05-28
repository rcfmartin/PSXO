function Remove-XoGroupUser
{
    <#
    .SYNOPSIS
    Removes user from group

    .DESCRIPTION
    Removes user from group

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Group ID

    .PARAMETER UserId
    Target User(s) Id

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Remove-XoGroupUser -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111" -UserId "06754190-adbf-46a9-ab00-558ffcc9a22f"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    [OutputType([XoGroup])]
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
        [string]
        $UserId
    )

    begin
    {



    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Removes user from group"))
        {
            $params = @{
                id     = $Id
                userId = $UserId
            }

            try
            {
                $body = New-JsonRpcRequest -Method "group.removeUser" -Params $params
                $null = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
                # return $resp
            }
            catch
            {
                throw $_.Exception.Message
            }

            try
            {
                $resp = Get-XoGroup -Session $Session -Id $Id -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }
            if ($null -ne $resp)
            {
                return $resp
            }
        }

    }

    end
    {

    }
}
