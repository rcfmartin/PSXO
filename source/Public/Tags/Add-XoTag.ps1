function Add-XoTag
{
    <#
    .SYNOPSIS
    Add a tag to an object

    .DESCRIPTION
    Add a tag to an object

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target object Id

    .PARAMETER Tag
    Tags to add

    .PARAMETER Color
    Color hex value


    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Add-XoTag -Session $sess -Tag "Critical" -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
    #>
    [CmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id,

        [Parameter(Mandatory = $true)]
        [string[]]
        $Tag,

        [Parameter()]
        [string]
        $Color
    )

    begin
    {
        $output = $null
    }

    process
    {
        foreach ($t in $Tag)
        {
            [hashtable]$params = @{
                id  = $Id
                tag = $t
            }

            try
            {
                $body = New-JsonRpcRequest -Method "tag.add" -Params $params
                $output = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }

            if ($PSBoundParameters.ContainsKey("Color"))
            {
                try
                {
                    $null = Update-XoTag -Session $Session -Tag $t -Color $Color -ErrorAction Stop
                }
                catch
                {
                    throw $_.Exception.Message
                }
            }
        }
        if (-not ($output.result))
        {
            throw "Failed to add the tag"
        }


    }

    end
    {
    }
}
