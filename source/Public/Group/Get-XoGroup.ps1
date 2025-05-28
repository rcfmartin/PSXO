function Get-XoGroup
{
    <#
    .SYNOPSIS
    Get all groups

    .DESCRIPTION
    Get all groups

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target Host ID

    .PARAMETER Name
    Target Group name

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoGroup -Session $sess

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoGroup -Session $sess -Name "MyGroup"

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoGroup -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
    #>
    [CmdletBinding()]
    [OutputType([XoGroup])]
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

    }

    process
    {

        $params = @{}


        try
        {
            $body = New-JsonRpcRequest -Method "group.getAll" -Params $params
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
            if ($PSBoundParameters.ContainsKey("Name"))
            {
                $items = @($items | Where-Object { $_.Name -ilike "*$($Name)*" })
            }
            foreach ($item in $items)
            {

                [XoGroup]::new(@{
                        Id    = $item.Id
                        Name  = $item.Name
                        Users = $item.Users

                    })
            }
        }

    }

    end
    {
        # return $result
    }
}
