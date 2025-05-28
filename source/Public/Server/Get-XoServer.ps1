function Get-XoServer
{
    <#
    .SYNOPSIS
    Get registered servers

    .DESCRIPTION
    Get registered servers

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Server Id

    .PARAMETER Label
    Target Label

    .PARAMETER Server
    Target server

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoServer -Session $sess

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoServer -Session $sess -Name "Server01"
    #>
    [CmdletBinding(DefaultParameterSetName = "Default")]
    [OutputType([XoServer])]
    param (
        [Parameter(ParameterSetName = "Default")]
        [Parameter(ParameterSetName = "Id")]
        [Parameter(ParameterSetName = "Name")]
        [Parameter(ParameterSetName = "Server")]
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ParameterSetName = "Id")]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id,

        [Parameter(ParameterSetName = "Name")]
        [string]
        $Label,

        [Parameter(ParameterSetName = "Server")]
        [string]
        $Server

    )

    begin
    {

    }

    process
    {

        $params = @{}



        try
        {
            $body = New-JsonRpcRequest -Method "server.getAll" -Params $params
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }



        if ($null -ne $resp)
        {
            $items = [pscustomobject]$resp.result


            if ($PSBoundParameters.ContainsKey("Label"))
            {
                $items = @($items | Where-Object { $_.label -ilike "*$($Label)*" })
            }
            if ($PSBoundParameters.ContainsKey("Id"))
            {
                $items = @($items | Where-Object { $_.id -ieq "$($Id)" })
            }
            if ($PSBoundParameters.ContainsKey("Server"))
            {
                $items = @($items | Where-Object { $_.host -ieq "$($Server)" })
            }
            foreach ($item in $items)
            {

                [XoServer]::new(@{
                        AllowUnauthorized = $item.allowUnauthorized
                        Server            = $item.host
                        Label             = $item.label
                        Username          = $item.username
                        PoolNameLabel     = $item.poolNameLabel
                        Enabled           = $item.enabled
                        ReadOnly          = $item.readOnly
                        Id                = $item.id
                        Status            = $item.status
                        PoolId            = $item.poolId
                    })
            }
        }

    }

    end
    {
        # return $result
    }
}
