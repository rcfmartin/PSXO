function Get-XoTask
{
    <#
    .SYNOPSIS
    Get Tasks

    .DESCRIPTION
    Get list of tasks

    .PARAMETER Session
    XoSession object

    .PARAMETER Id
    Target task Id

    .EXAMPLE
    $sess = New-XoSession -Uri "https://xoa.example.com" -Token "Caywizq1kyz7G2mg25Tc2rk_KxgIb063DnM4ScqdMVE"
    Get-XoTask -Session $sess
    #>
    [CmdletBinding()]
    [OutputType([XoTask])]
    param (
        [Parameter(Mandatory = $true)]
        [XoSession]
        $Session,

        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("Uuid")]
        [string]
        $Id
    )

    begin
    {
        $api = "$($Session.Uri)/rest/v0/tasks"
    }

    process
    {
        if ($PSBoundParameters.ContainsKey("Id"))
        {
            $api = "$($Session.Uri)/rest/v0/tasks/$($Id)"
        }
        try
        {
            $result = Invoke-RestMethod -Uri "$($api)?fields=*" -Method Get -WebSession $Session.Session -ErrorAction Stop
        }
        catch
        {
            throw $_
        }

        foreach ($task in $result)
        {
            [XoTask]::new(@{
                    Id         = $task.id
                    Properties = $task.properties
                    Start      = $task.start
                    Status     = $task.status
                    UpdatedAt  = $task.updatedAt
                    "End"      = $task.end
                    Result     = $task.result
                    Href       = $task.href
                })
        }

    }

    end
    {

    }
}
