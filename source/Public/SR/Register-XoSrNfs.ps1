function Register-XoSrNfs
{
    <#
    .SYNOPSIS
    Add NFS SR

    .DESCRIPTION
    Add NFS SR

    .PARAMETER Session
    XoSession object

    .PARAMETER HostId
    Target Host ID

    .PARAMETER Name
    Target SR name

    .PARAMETER Descritpion
    SR description

    .PARAMETER Server
    Remote Server hosting the NFS Share

    .PARAMETER ServerPath
    Path to the nfs share

    .PARAMETER NfsVersion
    NFS version

    .PARAMETER NfsOptions
    NFS Options

    .PARAMETER NfsUuid
    NFS UUID

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    $MyHost = Get-XoHost -Session $sess -Name "xen01"
    Register-XoSrNfs -Session $sess -HostId $MyHost.Id -Name "MyShare Test" -Descritpion "Test File Share" -Server "10.0.0.9" -ServerPath "/mnt/FileShares/test"
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
        $HostId,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Descritpion,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Server,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $ServerPath,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $NfsVersion,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $NfsOptions,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]
        $NfsUuid
    )

    begin
    {
        $params = @{
            host            = $HostId
            nameLabel       = $Name
            nameDescription = $Descritpion
            server          = $Server
            serverPath      = $ServerPath
        }

    }

    process
    {

        try
        {
            $body = New-JsonRpcRequest -Method "xo.getAllObjects" -Params @{filter = "type:pbd" }
            $test = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }
        $srExists = $test | Where-Object { (($_.result.psobject.Properties.Value.device_config.server -ieq "$($Server)") -and ($_.result.psobject.Properties.Value.device_config.serverpath -ieq "$($ServerPath)")) -or
                                                ($_.result.psobject.Properties.Value.device_config.location -ieq "$($Server):$($ServerPath)") }
        if ($srExists)
        {
            Write-Warning "SR with Server $($Server) and Path $($ServerPath) already exists"

            return Get-XoSr -Session $Session -Name $Name

        }

        if ($PSBoundParameters.ContainsKey("NfsVersion"))
        {
            $params["nfsVersion"] = $NfsVersion
        }
        if ($PSBoundParameters.ContainsKey("NfsOptions"))
        {
            $params["nfsOptions"] = $NfsOptions
        }
        if ($PSBoundParameters.ContainsKey("NfsUuid"))
        {
            $params["srUuid"] = $NfsUuid
        }


        try
        {
            $body = New-JsonRpcRequest -Method "sr.createNfs" -Params $params
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }

        if ($null -ne $resp)
        {
            $output = Get-XoSr -Session $Session -Name $Name
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
