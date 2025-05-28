function Update-XoHost
{
    <#
    .SYNOPSIS
    Disable Host

    .DESCRIPTION
    Disable Host

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Host ID

    .PARAMETER NameLabel
    New name for the host

    .PARAMETER NameDescription
    Description label for the host

    .PARAMETER IscsiIqn
    Iscsi qn for connection

    .PARAMETER MultiPathing
    bool value to enable multipathing

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Update-XoHost -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111" -NameDescription "Primary Host"
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    [OutputType([XoHost])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $Id,

        [Parameter()]
        [string]
        $NameLabel,

        [Parameter()]
        [string]
        $NameDescription,

        [Parameter()]
        [string]
        $IscsiIqn,

        [Parameter()]
        [bool]
        $MultiPathing


    )

    begin
    {



    }

    process
    {
        if ($PSCmdlet.ShouldProcess("Disable Host", $Id))
        {
            $params = @{
                id = $Id
            }

            if ($PSBoundParameters.containskey("NameLabel"))
            {
                $params["name_label"] = $NameLabel
            }
            if ($PSBoundParameters.containskey("NameDescription"))
            {
                $params["name_description"] = $NameDescription
            }
            if ($PSBoundParameters.containskey("IscsiIqn"))
            {
                $params["iscsiIqn"] = $IscsiIqn
            }
            if ($PSBoundParameters.containskey("MultiPathing"))
            {
                $params["multiPathing"] = $MultiPathing
            }

            try
            {
                $body = New-JsonRpcRequest -Method "host.set" -Params $params
                $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
                # return $resp
            }
            catch
            {
                throw $_.Exception.Message
            }
        }

        if (-not $resp.result)
        {
            throw "An Error occurred. $($resp.Error)"
        }

        try
        {
            $output = Get-XoHost -Session $Session -Id $Id
        }
        catch
        {
            throw $_
        }



    }

    end
    {
        return $output
    }
}
