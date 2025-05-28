function Get-XoSchedule
{
    <#
    .SYNOPSIS
    Get Tags

    .DESCRIPTION
    Get Tags

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Schedule Id

    .PARAMETER Name
    Target schedule Name

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoSchedule -Session $sess -Name "Daily"
    #>
    [CmdletBinding(DefaultParameterSetName = "Default")]
    [OutputType([XoSchedule])]
    param (
        [Parameter(Mandatory = $true)]
        [Parameter(ParameterSetName = "Default")]
        [Parameter(ParameterSetName = "Id")]
        [Parameter(ParameterSetName = "Name")]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [Parameter(ParameterSetName = "Id")]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id,

        [Parameter(ParameterSetName = "Name")]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
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
            $body = New-JsonRpcRequest -Method "schedule.getAll" -Params $params
            $result = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }

        if ($result.result.count -gt 0)
        {
            $output = foreach ($item in $result.result)
            {
                [XoSchedule]::new(@{
                        Id       = $item.id
                        Name     = $item.name
                        Cron     = $item.cron
                        Enabled  = $item.enabled
                        JobId    = $item.jobid
                        TimeZone = $item.timezone
                    })
            }
        }

        if ($PSBoundParameters.ContainsKey("Id"))
        {
            return $output | Where-Object { "$($_.Id)" -ieq "$($Id)" }
        }

        if ($PSBoundParameters.ContainsKey("Name"))
        {
            return $output | Where-Object { "$($_.Name)" -ilike "*$($Name)*" }
        }

        return $output
    }

    end
    {

    }
}
