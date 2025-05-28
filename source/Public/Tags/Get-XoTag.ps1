function Get-XoTag
{
    <#
    .SYNOPSIS
    Get Tags

    .DESCRIPTION
    Get Tags

    .PARAMETER Session
    XoSession object

    .PARAMETER Tag
    Target Tag name


    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoTag -Session $sess -Tag "Critical"
    #>
    [CmdletBinding()]
    [OutputType([XoTag])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Tag
    )

    begin
    {
        $output = $null
    }

    process
    {
        [hashtable]$params = @{}


        try
        {
            $body = New-JsonRpcRequest -Method "tag.getAllConfigured" -Params $params
            $result = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }

        if ($result.result.count -gt 0)
        {
            $output = foreach ($tagItem in $result.result)
            {
                [XoTag]::new(@{
                        Tag   = $tagItem.id
                        Color = $tagItem.color
                    })
            }
        }

        if ($PSBoundParameters.ContainsKey("Tag"))
        {
            return $output | Where-Object { "$($_.Tag)" -ieq "$($Tag)" }
        }
        return $output


    }

    end
    {
    }
}
