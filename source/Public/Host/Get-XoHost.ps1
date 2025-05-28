function Get-XoHost
{
    <#
    .SYNOPSIS
    Get all Hosts

    .DESCRIPTION
    Get all Hosts

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Host ID

    .PARAMETER Name
    Target Host name

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoHost -Session $sess

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoHost -Session $sess -Name "MyHost"

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoHost -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
    #>
    [CmdletBinding()]
    [OutputType([XoHost])]
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
        $filter = "type:host"

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
            # return $resp
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
                $output = $items.$item | Where-Object { $_.type -ieq "host" }
                if (-not $output)
                {
                    continue
                }
                [XoHost]::new(@{
                        Id                = $output."id"
                        NameLabel         = $output."name_label"
                        Address           = $output."address"
                        AgentStartTime    = [System.DateTimeOffset]::FromUnixTimeSeconds($output."agentStartTime").ToLocalTime()
                        BiosStrings       = $output."bios_strings"
                        Build             = $output."build"
                        Certificates      = $output."certificates"
                        ChipsetInfo       = $output."chipset_info"
                        ControlDomain     = $output."controlDomain"
                        Cpus              = $output."cpus"
                        CurrentOperations = $output."current_operations"
                        Enabled           = $output."enabled"
                        Hostname          = $output."hostname"
                        HvmCapable        = $output."hvmCapable"
                        IscsiIqn          = $output."iscsiIqn"
                        LicenseExpiry     = $output."license_expiry"
                        LicenseParams     = $output."license_params"
                        LicenseServer     = $output."license_server"
                        Logging           = $output."logging"
                        Memory            = $output."memory"
                        Multipathing      = $output."multipathing"
                        NameDescription   = $output."name_description"
                        OtherConfig       = $output."otherConfig"
                        Patches           = $output."patches"
                        PBDs              = $output."`$PBDs"
                        PCIs              = $output."PCIs"
                        PGPUs             = $output."PGPUs"
                        PIFs              = $output."PIFs"
                        Pool              = $output."`$pool"
                        PoolId            = $output."`$poolId"
                        PowerOnMode       = $output."powerOnMode"
                        PowerState        = $output."power_state"
                        ProductBrand      = $output."productBrand"
                        RebootRequired    = $output."rebootRequired"
                        ResidentVms       = $output."residentVms"
                        StartTime         = [System.DateTimeOffset]::FromUnixTimeSeconds($output.startTime).ToLocalTime()
                        SupplementalPacks = $output."supplementalPacks"
                        Tags              = $output."tags"
                        Type              = $output."type"
                        Uuid              = $output."uuid"
                        Version           = $output."version"
                        XapiRef           = $output."_xapiRef"
                        ZstdSupported     = $output."zstdSupported"
                    })
            }
        }

    }

    end
    {
        # return $result
    }
}
