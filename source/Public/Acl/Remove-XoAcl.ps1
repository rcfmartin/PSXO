function Remove-XoAcl
{
    <#
    .SYNOPSIS
    Removes an existing ACL

    .DESCRIPTION
    Removes an existing ACL

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
    Remove-XoAcl -Session $sess -Subject "8054b336-3c07-4f6f-8b0a-3e8ccdb8c454" -Object "cbdb37be-0ad2-972a-9537-ccc6a7ff95fd" -Action "admin"

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

        [Parameter()]
        [ValidateSet("admin", "operator", "viewer")]
        [string]
        $Action
    )

    begin
    {

    }

    process
    {
        if ($PSCmdlet.ShouldProcess("Subject - $($Subject) - Object: $($Object) - Action: $($Action)", "Remove Acl"))
        {


            $params = @{
                subject = $Subject
                object  = $Object
                action  = $Action
            }


            try
            {
                $body = New-JsonRpcRequest -Method "acl.remove" -Params $params
                $null = Send-WebSocketJsonRpc -Session $Session -Body $body -ErrorAction Stop
            }
            catch
            {
                throw $_.Exception.Message
            }
        }

    }

    end
    {
        # return $result
    }
}
