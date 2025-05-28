function Get-XoSr
{
    <#
    .SYNOPSIS
    Get all SRs

    .DESCRIPTION
    Get all SRs

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Host ID

    .PARAMETER Name
    Target Host name

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoSr -Session $sess

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoSr -Session $sess -Name "MySr"

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoSr -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
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
        [string]
        $Name
    )

    begin
    {
        $filter = "type:sr"

        $params = @{
            filter = $filter
        }

    }

    process
    {

        if ($PSBoundParameters.ContainsKey("Id"))
        {
            $params["filter"] = "id:$($Id)"
        }
        if ($PSBoundParameters.ContainsKey("Name"))
        {
            $params["filter"] = "name_label:$($Name)"
        }


        try
        {
            $body = New-JsonRpcRequest -Method "xo.getAllObjects" -Params $params
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }

        if ($null -ne $resp)
        {
            $items = [pscustomobject]$resp.result
            foreach ($item in $items.psobject.Properties.Name)
            {
                $output = $items.$item | Where-Object { $_.type -ieq "SR" }
                if (-not $output)
                {
                    continue
                }
                [XoSr]::new(@{
                        AllocationStrategy = $output."allocationStrategy"
                        Container          = $output."`$container"
                        ContentType        = $output."content_type"
                        CurrentOperations  = $output."current_operations"
                        Id                 = $output."id"
                        InMaintenanceMode  = $output."inMaintenanceMode"
                        NameDescription    = $output."name_description"
                        NameLabel          = $output."name_label"
                        OtherConfig        = $output."other_config"
                        PBDs               = $output."`$PBDs"
                        PhysicalUsage      = $output."physical_usage"
                        Pool               = $output."`$pool"
                        PoolId             = $output."`$poolId"
                        Shared             = $output."shared"
                        Size               = $output."size"
                        SmConfig           = $output."sm_config"
                        SRType             = $output."SR_type"
                        Tags               = $output."tags"
                        Type               = $output."type"
                        Usage              = $output."usage"
                        Uuid               = $output."uuid"
                        VDIs               = $output."VDIs"
                        XapiRef            = $output."_xapiRef"
                    })
            }
        }

    }

    end
    {
        # return $result
    }
}
