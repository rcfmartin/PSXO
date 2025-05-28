function Remove-XoSession
{
    <#
    .SYNOPSIS
    Removes the XoSession

    .DESCRIPTION
    Removes the XoSession

    .PARAMETER Session
    Target XoSession

    .EXAMPLE
    $session = New-XoSession -Uri "https://xo.example.com" -Token "DPjwthwfJLTJj1UPmAojAQIlQHtsMzNabkTOTZz5uzU"
    Remove-XoSession -Session $session

    .EXAMPLE
    $session = New-XoSession -Uri "https://xo.example.com" -Token "DPjwthwfJLTJj1UPmAojAQIlQHtsMzNabkTOTZz5uzU"
    $session | Remove-XoSession
    #>
    [CmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(ValueFromPipeline = $true, Mandatory = $true)]
        [XoSession]
        $Session
    )

    begin
    {
        $toDelete = @()

    }

    process
    {
        $null = $Session.Session.Dispose()
        $toDelete += $Session

    }

    end
    {
        $newList = $Script:XoSessions.Sessions | Where-Object { $_.Id -notin $toDelete.Id }
        $null = $Script:XoSessions.Clear()

        foreach ($item in $newList)
        {
            $Script:XoSessions.AddSession($item)
        }

    }
}
