function Get-XoTagColor
{
    <#
    .SYNOPSIS
    Get A list of RGB colors

    .DESCRIPTION
    Get A list of RGB colors

    .PARAMETER TagColorId
    Tag color Id

    .EXAMPLE
    Get-XoTagColor
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateSet([XoTagColor])]
        [string]
        $TagColorId
    )

    begin
    {

    }

    process
    {
        $colors = [XoTagColor]::new()

        foreach ($color in $colors.GetAllColors())
        {
            $names = $color.psobject.properties.name
            $tagColors = foreach ($name in $names)
            {
                $hex = $color.$name.hex
                if ($hex -inotmatch '^#?([0-9A-Fa-f]{6})$')
                {
                    $temp = $hex
                    $newHex = "$($temp[0])$($temp[1])$($temp[1])$($temp[2])$($temp[2])$($temp[3])$($temp[3])"
                    $hex = $newHex
                }
                [pscustomobject]@{
                    TagColorId = $name
                    Name       = $color.$name.name
                    Color      = $hex
                }
            }
        }

        if ($PSBoundParameters.ContainsKey("TagColorId"))
        {
            return $tagColors | Where-Object { $_.TagColorId -ieq $TagColorId }
        }
        else
        {
            return $tagColors
        }
    }

    end
    {

    }
}
