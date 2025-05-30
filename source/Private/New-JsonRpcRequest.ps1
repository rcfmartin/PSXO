function New-JsonRpcRequest
{
    <#
    .SYNOPSIS
    Create the json string for the RPC request

    .DESCRIPTION
    Create the json string for the RPC request

    .PARAMETER Method
    JSON-RPC Method

    .PARAMETER Params
    Hashtable with the parameters

    .EXAMPLE
    New-JsonRpcRequest -Method "vm.start" -Param @{id = 9ace51e1-dfbd-4617-8db3-88f28974e111}
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "low")]
    param (
        [string]$Method,
        [object]$Params
    )
    if($PSCmdlet.ShouldProcess($Method, "Create Request"))
    {
return @{
        jsonrpc = "2.0"
        method  = $Method
        params  = $Params
        id      = (New-Guid).ToString()
    } | ConvertTo-Json -Depth 5
    }

}
