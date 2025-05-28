param
(
    [Parameter()]
    [string]
    $OutputDirectory = (property OutputDirectory (Join-Path $BuildRoot 'output'))
)
begin
{

}
process
{
    task 'BuildIndexFile' {
        $index = Get-Content -Path $(Join-Path $docs -ChildPath "about_$($ModuleName).md")
        Set-Content -Value $index -Path $(Join-Path $docs "index.md")
    }

    task 'AddDocsToSubmodule' {
        $subModuleName = "$($ModuleName.ToLower()).wiki"
        $subModule = Join-Path $BuildRoot $subModuleName
        # $projPath = Join-Path $subModule "docs" -AdditionalChildPath $ModuleName

        if (-not $(Test-Path $subModule))
        {
            git submodule update --init --recursive
        }
        else
        {
            git submodule update --remote --merge
        }

        # if (-not $(Test-path $projPath))
        # {
        #     $null = New-Item $projPath -ItemType Directory
        # }
        Remove-Item "$($subModule)/*.md" -ErrorAction SilentlyContinue
        Copy-Item -Path "$($docs)/*" -Recurse -Force  -Destination $subModule

        Copy-Item -Path $(Join-Path $BuildRoot "LICENSE") -Destination $(Join-Path -Path $subModule -ChildPath "LICENSE.md")


        Copy-Item -Path $(Join-Path $BuildRoot "README.md") -Destination $(Join-Path -Path $subModule -ChildPath "Home.md")

        Push-Location -Path $subModule
        Write-Build yellow "Dir: $($subModule)"
        git pull
        # if (Get-Command docker)
        # {
        #     docker run -i --rm -v "$($subModule):/docs" squidfunk/mkdocs-material build
        # }
        # else
        # {
        #     throw "Docker not found"
        # }
        git add .

        git commit -m "Adding docs from pipeline for module: $($ModuleName)"

        git push origin main

        Pop-Location
    }

    task 'BuildHelpFiles' {
        $Script:OutputDirectory = Get-SamplerAbsolutePath -Path $OutputDirectory -RelativeTo $BuildRoot
        $Script:psd = Get-ChildItem -Path "$($BuildRoot)/source" -include *.psd1 -File -Force -Recurse
        $Script:ModuleInfo = Invoke-Expression "$(Get-Content $psd.FullName |Out-string)"
        $Script:ModuleName = $psd.BaseName
        $Script:ModuleDir = Join-Path "$($OutputDirectory)" -ChildPath "module" -AdditionalChildPath $ModuleName, $ModuleInfo.ModuleVersion
        $Script:help = Join-Path $ModuleDir 'en-US'
        $Script:docs = Join-Path $BuildRoot "docs"
        $Script:index = $(Join-Path $docs "index.md")
        $Script:Readme = "$($BuildRoot)\README.md"
        Write-Build Magenta "Creating External Help"
        $command = {
            Import-Module "$($Using:ModuleDir)\$($Using:ModuleName).psd1"
            if (Test-Path $Using:help)
            {
                $null = Remove-Item $Using:help -Recurse -Force
            }
            # Import-Module $(Join-Path $ModuleDir -ChildPath "$($Using:ModuleName).psd1") -Force
            if (-not $(Test-Path $Using:docs))
            {
                pwsh -noprofile -command "Import-Module `"$($Using:ModuleDir)\$($Using:ModuleName).psd1`";New-MarkdownHelp -Module '$Using:ModuleName' -OutputFolder '$Using:docs' -Force"
            }
            else
            {
                pwsh -noprofile -command "Import-Module `"$($Using:ModuleDir)\$($Using:ModuleName).psd1`";New-MarkdownHelp -Module '$Using:ModuleName' -OutputFolder '$Using:docs' -Force"
                # pwsh -noprofile -command "Import-Module `"$($Using:ModuleDir)\$($Using:ModuleName).psd1`";Update-MarkdownHelpModule -Path $Using:docs"
            }
            try
            {
                pwsh -noprofile -command "Import-Module `"$($Using:ModuleDir)\$($Using:ModuleName).psd1`";New-MarkdownAboutHelp -OutputFolder '$Using:docs' -Aboutname '$Using:ModuleName' -ErrorAction SilentlyContinue"
            }
            catch
            {
                if ($_.Exception.Message -inotmatch 'The\sfile.*already.*')
                {
                    throw $_.Exception.Message
                }
            }
            try
            {
                pwsh -noprofile -command "Import-Module `"$($Using:ModuleDir)\$($Using:ModuleName).psd1`"; New-ExternalHelp '$Using:docs' -OutputPath '$Using:help' -ErrorAction SilentlyContinue"
            }
            catch
            {
                throw $_.Exception.Message
            }
        }
        $job = Start-ThreadJob -ScriptBlock $command
        $job | Wait-Job | Receive-Job

    }
}
