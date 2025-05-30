function Remove-XoTag
{
    <#
    .SYNOPSIS
    Remove a tag

    .DESCRIPTION
    Remove a tag

    .PARAMETER Session
    XoSession object

    .PARAMETER Tag
    Target tag Id

    .PARAMETER Id
    Target object Id


    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Remove-XoTag -Session $sess -Tag"Critical" -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Tag,

        [Parameter(Mandatory = $true)]
        [string]
        $Id
    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Id, "Remove Tag"))
        {
            [hashtable]$params = @{
                tag = "$($Tag)"
                id  = $Id
            }

            try
            {
                $body = New-JsonRpcRequest -Method "tag.remove" -Params $params
                $result = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }

            if (-not $result.result)
            {
                throw "Failed to update tag. $($result.Error)"
            }
        }
    }

    end
    {
    }
}
