@{

# Script module or binary module file associated with this manifest.
RootModule = 'DscResource.AnalyzerRules.psm1'

# Version number of this module.
ModuleVersion = '0.2.0'

# Supported PSEditions
CompatiblePSEditions = @('Desktop','Core')

# ID used to uniquely identify this module
GUID = '7cb2ad55-ea9f-499c-9205-77fc0160e66e'

# Author of this module
Author = 'DSC Community'

# Company or vendor of this module
CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = '(c) 2019 dsccommunity.org. All rights reserved.'

# Description of the functionality provided by this module
Description = 'PS Script Analyzer Custom Rules for the DSC Community standards'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(
    @{ModuleName = 'PSScriptAnalyzer'; ModuleVersion = '1.18.3'}
)

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @('Measure-CatchClause','Measure-DoUntilStatement','Measure-DoWhileStatement','Measure-ForEachStatement','Measure-ForStatement','Measure-FunctionBlockBrace','Measure-Hashtable','Measure-IfStatement','Measure-Keyword','Measure-ParameterBlockMandatoryNamedArgument','Measure-ParameterBlockParameterAttribute','Measure-SwitchStatement','Measure-TryStatement','Measure-TypeDefinition','Measure-WhileStatement')

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('PSScriptAnalyzer','PSSA','Analyzer','AnalyzerRules','DesiredStateConfiguration', 'DSC', 'DSCResourceKit', 'DSCResource','Windows','MacOS','Linux')

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        Prerelease = ''

        # ReleaseNotes of this module
        ReleaseNotes = '# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

- Fix issue with DSC composite resources.
- Fix issues with LF by hashtable check.

### Added

- Create new module out of the nested one from DscResource.tests
- Used the DSC custom rules from this built module to apply to its own source
- Suggested corrections for keyword check

### Changed

- Performance improvement on QA tests
- Excluded Help Quality for now
'

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}






