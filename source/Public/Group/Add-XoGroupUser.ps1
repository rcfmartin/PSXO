function Add-XoGroupUser
{
    <#
    .SYNOPSIS
    Adds users to group

    .DESCRIPTION
    Adds users to group

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target group Id

    .PARAMETER UserId
    Target User(s) Id

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Add-XoGroupUser -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111" -UserId "06754190-adbf-46a9-ab00-558ffcc9a22f"

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Add-XoGroupUser -Session $sess -Id "9ace51e1-dfbd-4617-8db3-88f28974e111" -UserId "06754190-adbf-46a9-ab00-558ffcc9a22f","12354190-adbf-46a9-ab00-558ffcc9a21g"
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

        [Parameter(Mandatory = $true)]
        [string[]]
        $UserId
    )

    begin
    {

    }

    process
    {

        $params = @{
            id = $Id
        }
        foreach ($user in $UserId)
        {
            try
            {
                $userCheck = Get-XoUser -Session $Session -Id $user -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }
            if ($null -ieq $userCheck)
            {
                Write-Warning "UserId '$($user)' was not found"
                continue
            }
            $params["userId"] = $user
            try
            {
                $body = New-JsonRpcRequest -Method "group.addUser" -Params $params
                $null = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }
        }

        try
        {
            $resp = Get-XoGroup -Session $Session -Id $Id -ErrorAction Stop
        }
        catch
        {
            throw $_.Exception.Message
        }
        if ($null -ne $resp)
        {
            return $resp
        }

    }

    end
    {
        # return $result
    }
}
