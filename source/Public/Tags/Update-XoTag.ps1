function Update-XoTag
{
    <#
    .SYNOPSIS
    Update a tag

    .DESCRIPTION
    Update a tag

    .PARAMETER Session
    XoSession object

    .PARAMETER Tag
    Target tag Id

    .PARAMETER Color
    Color hex value


    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Update-XoTag -Session $sess -Tag "Critical" -Color "#000000"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
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
        $Color
    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Tag, "Update Tag"))
        {
            [hashtable]$params = @{
                id = "$($Tag)"
            }
            if ($PSBoundParameters.containskey("Color"))
            {
                $params["color"] = $($Color)
            }

            try
            {
                $body = New-JsonRpcRequest -Method "tag.set" -Params $params
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
