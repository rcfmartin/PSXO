function Copy-XoVirtualMachine
{
    <#
    .SYNOPSIS
    Clone virtual machine

    .DESCRIPTION
    Clone virtual machine

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    target VM Id

    .PARAMETER Name
    New vm Name

    .PARAMETER FullCopy
    Perform a full copy

    .PARAMETER Wait
    Keep the session until the copy is done.

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Copy-XoVirtualMachine -Session $sess -Id "6d2b6673-3f2e-dd2c-ed8c-e2eefc0eb373" -Name "NewVm" -FullCopy:$true -Wait
    #>
    [CmdletBinding(DefaultParameterSetName = "XoObject")]
    [OutputType([XoVirtualMachine], ParameterSetName = "XoVirtualMachine")]
    [OutputType([System.Object], ParameterSetName = "XoObject")]
    param (
        [Parameter(Mandatory = $true)]
        [Parameter(ParameterSetName = "XoObject")]
        [Parameter(ParameterSetName = "XoVirtualMachine")]
        [XoSession]
        $Session,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Parameter(ParameterSetName = "XoObject")]
        [Parameter(ParameterSetName = "XoVirtualMachine")]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $Id,

        [Parameter(ParameterSetName = "XoObject")]
        [Parameter(ParameterSetName = "XoVirtualMachine")]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name,

        [Parameter(ParameterSetName = "XoObject")]
        [Parameter(ParameterSetName = "XoVirtualMachine")]
        [bool]
        $FullCopy = $true,

        [Parameter(ParameterSetName = "XoVirtualMachine")]
        [switch]
        $Wait
    )

    begin
    {

    }

    process
    {
        [hashtable]$params = @{
            id        = $Id
            name      = $Name
            full_copy = $FullCopy
        }
        try
        {
            $body = New-JsonRpcRequest -Method "vm.clone" -Params $params
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }


        if ($PSBoundParameters.ContainsKey("Wait"))
        {
            if ($resp)
            {
                $prop = $resp.params.items.psobject.Properties.Value | Where-Object { $_.name_label -ieq "Async.VM.copy" }

            }
            $null = Get-XoTaskProgress -Session $Session -Id $prop.id

            try
            {
                $newVm = Get-XoVirtualMachine -Session $Session -Name "$($Name)" -ErrorAction Stop

            }
            catch
            {
                throw $_.Exception.Message
            }
        }


    }

    end
    {
        if ($newVm)
        {
            return $newVm
        }
        else
        {
            return $resp
        }
    }
}
