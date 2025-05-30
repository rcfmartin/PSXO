function New-XoAcl
{
    <#
    .SYNOPSIS
    Creates a new ACL

    .DESCRIPTION
    Creates a new ACL

    .PARAMETER Session
    XoSession object

    .PARAMETER Subject
    Target Subject

    .PARAMETER Object
    Target Object

    .PARAMETER Action
    Target Action

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xo.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    New-XoAcl -Session $sess -Subject "8054b336-3c07-4f6f-8b0a-3e8ccdb8c454" -Object "cbdb37be-0ad2-972a-9537-ccc6a7ff95fd" -Action "admin"

    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
    [OutputType([XoAcl])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(Mandatory = $true)]
        [string]
        $Subject,

        [Parameter(Mandatory = $true)]
        [string]
        $Object,

        [Parameter(Mandatory = $true)]
        [ValidateSet("admin", "operator", "viewer")]
        [string]
        $Action
    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess($Subject, "Create new ACL"))
        {

            $params = @{
                subject = $Subject
                object  = $Object
                action  = $Action
            }


            try
            {
                $body = New-JsonRpcRequest -Method "acl.add" -Params $params
                $null = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }


            try
            {
                $resp = Get-XoAcl -Session $Session -ErrorAction Stop | Where-Object { $_.Object -ieq $Object -and $_.Subject -ieq $Subject -and $_.Action -ieq $Action }
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
    }

    end
    {
        # return $result
    }
}
