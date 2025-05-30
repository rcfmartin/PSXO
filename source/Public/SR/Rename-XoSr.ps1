function Rename-XoSr
{
    <#
    .SYNOPSIS
    Rename SR

    .DESCRIPTION
    Rename SR

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Host ID

    .PARAMETER Name
    Target SR name

    .PARAMETER Description
    SR description

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Rename-XoSr -Session $sess Id "a933cb47-fbf7-42a5-af39-abac9fc3feca" -Name "MySR Test" -Description "Test SR"
    #>
    [CmdletBinding()]
    [OutputType([XoSr])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $Id,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $Description
    )

    begin
    {
        $params = @{
            id = $Id
        }

    }

    process
    {

        if ($PSBoundParameters.ContainsKey("Name"))
        {
            $params["name_label"] = $Name
        }
        if ($PSBoundParameters.ContainsKey("Description"))
        {
            $params["name_description"] = $Description
        }

        try
        {
            $body = New-JsonRpcRequest -Method "sr.set" -Params $params
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }

        if ($null -ne $resp)
        {
            $output = Get-XoSr -Session $Session -Id $Id
        }

    }

    end
    {
        if ($null -ne $output)
        {
            return $output
        }
    }
}
