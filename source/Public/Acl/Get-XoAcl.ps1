function Get-XoAcl
{
    <#
    .SYNOPSIS
    Get Acls

    .DESCRIPTION
    Get Acls

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target ACL Id

    .PARAMETER Action
    Target action

    .PARAMETER Subject
    Target subject

    .PARAMETER Object
    Target Object

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoAcl -Session $sess

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoAcl -Session $sess -Action Admin
    #>
    [CmdletBinding(DefaultParameterSetName = "Default")]
    [OutputType([XoAcl])]
    param (
        [Parameter(ParameterSetName = "Default")]
        [Parameter(ParameterSetName = "Id")]
        [Parameter(ParameterSetName = "Action")]
        [Parameter(ParameterSetName = "Object")]
        [Parameter(ParameterSetName = "Subject")]
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ParameterSetName = "Id")]
        [ValidateNotNullOrEmpty()]
        [string]
        $Id,

        [Parameter(ParameterSetName = "Action")]
        [ValidateSet("admin", "operator", "viewer")]
        [string]
        $Action,

        [Parameter(ParameterSetName = "Subject")]
        [string]
        $Subject,

        [Parameter(ParameterSetName = "Object")]
        [string]
        $Object

    )

    begin
    {

    }

    process
    {

        $params = @{}


        try
        {
            $body = New-JsonRpcRequest -Method "acl.get" -Params $params
            $resp = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }



        if ($null -ne $resp)
        {
            $items = [pscustomobject]$resp.result
            if ($PSBoundParameters.ContainsKey("Id"))
            {
                $items = @($items | Where-Object { $_.id -ieq $Id })
            }
            if ($PSBoundParameters.ContainsKey("Subject"))
            {
                $items = @($items | Where-Object { $_.subject -ilike "*$($Subject)*" })
            }
            if ($PSBoundParameters.ContainsKey("Object"))
            {
                $items = @($items | Where-Object { $_.object -ilike "*$($Object)*" })
            }

            if ($PSBoundParameters.ContainsKey("Action"))
            {
                $items = @($items | Where-Object { $_.action -ilike "*$($Action)*" })
            }
            foreach ($item in $items)
            {

                [XoAcl]::new(@{
                        Id      = $item.Id
                        Action  = $item.Action
                        Subject = $item.Subject
                        Object  = $item.Object

                    })
            }
        }

    }

    end
    {
        # return $result
    }
}
