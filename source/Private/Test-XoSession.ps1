function Test-XoSession
{
    <#
    .SYNOPSIS
    Test the current session status

    .DESCRIPTION
    Test the current session status

    .PARAMETER Session
    XoSession object

    .EXAMPLE
    Test-XoSession -Session $Session
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [XoSession]$Session
    )

    begin
    {

    }

    process
    {
        try
        {
            $null = Get-XoUser -Session $Session -ErrorAction Stop
            return $null
        }
        catch
        {
            throw $_
        }
    }

    end
    {

    }
}
