function ConvertTo-XoVirtualMachineTemplate
{
    <#
    .SYNOPSIS
    Ejects the CD

    .DESCRIPTION
    Ejects the CD

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Virtual machine ID

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    ConvertTo-XoVirtualMachineTemplate -Session $sess -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
    #>
    [CmdletBinding()]
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
        [hashtable]$params = @{
            id = $Id
        }
        try
        {
            $body = New-JsonRpcRequest -Method "vm.convertToTemplate" -Params $params
            $result = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }

    }

    end
    {
        if (-not $result)
        {
            throw "Failed to convert VM to template. Status: $($result)"
        }
    }
}
