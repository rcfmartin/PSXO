# Build The Module

> The built module will be in the `otuput` folder

```powershell
./build.ps1
```

# PSXO

A PowerShell wrapper for the Xen Orchestra API.

This module provides PowerShell cmdlets for interacting with Xen Orchestra.
It primarily uses the JSON-RPC API, with some cmdlets also utilizing the REST API where appropriate.

## Examples

## Session

> The session object needs to be passed to all cmdlets.

### Create a session

```powershell
$Session = New-XoSession -Uri "https://xo.example.com" -Token "<Your Token>"
```

### Get all sessions

```powershell
Get-XoSession
```

### Remove Sessions

```powershell
Get-XoSession | Remove-XoSession
```

### Remove a specific session

```powershell
Remove-XoSession -Session $Session
```

## Hosts

### Get all Hosts

```powershell
Get-XoHost -Session $Session
```

### Get Hosts by Name

```powershell
Get-XoHost -Session $Session -Name "MyHost"
```

### Get Hosts by Id

```powershell
Get-XoHost -Session $Session -Id "7d5550g5-527e-445b-1f7a-34d9ca0b7242"
```

### Enable Host

```powershell
Enable-XoHost -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Disable Host

```powershell
Disable-XoHost -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Detach host

```powershell
Disconnect-XoHost -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Emergency Shutdown Host

```powershell
Invoke-XoHostEmergencyShutdown -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Remove Host from the XAPI database

```powershell
Remove-XoHost -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Get host bios info

```powershell
Get-XoHostBiosInfo -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Get Host block device

```powershell
Get-XoHostBlockDevice -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Get Host IPMI Sensor

```powershell
Get-XoHostIpmiSensor -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Get host mdadm RAID health information

```powershell
Get-XoHostMdadmHealth -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Get host scheduler granularity

```powershell
Get-XoHostSchedulerGranularity -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Get host smart ctl health

```powershell
Get-XoHostSmartCtlHealth -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Restart Host

```powershell
Restart-XoHost -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Restart Host Agent

```powershell
Restart-XoHostAgent -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Update Host properties

```powershell
Update-XoHost -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111" -NameDescription "Primary Host"
```

### Set Host to maintenance Mode

```powershell
Invoke-XoHostMaintenanceMode -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Start Host

```powershell
Start-XoHost -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Stop Host

```powershell
Stop-XoHost -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

## Virtual Machines

### Get all VMs

> This cmdlet returns the Type `VM` by default.

```powershell
Get-XoVirtualMachine -Session $Session
```

### Get VM by Name

```powershell
Get-XoVirtualMachine -Session $Session -Name "My VM"
```

### Get VM by Id

```powershell
Get-XoVirtualMachine -Session $Session -Id "7d5550g5-527e-445b-1f7a-34d9ca0b7242"
```

### Create a new VM

```powershell
New-XoVirtualMachine -Session $Session -NameLabel "My New VM" -Template "4fb83780-2a39-2c1a-b185-734740d2962d" -Tag "VeryImportantTag"
```

### Update a VM

> You can use `2GB`,`1MB`,`1TB`,etc.. as powershell converts the value for you.

```powershell
Update-XoVirtualMachine -Session $Session -Id "7d5550g5-527e-445b-1f7a-34d9ca0b7242" -NameDescription "Updated Vm Name" -Cpus 2 -Memory 2GB
```

### Convert VM to template

```powershell
ConvertTo-XoVirtualMachineTemplate -Session $Session -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
```

### Copy VM

```powershell
Copy-XoVirtualMachine -Session $Session -Id "7d5550g5-527e-445b-1f7a-34d9ca0b7242" -Name "My New VM" -FullCopy:$true -Wait
```

### Mound ISO to VM

```powershell
Mount-XoVirtualMachineCD -Session $Session -Id "06754190-adbf-46a9-ab00-558ffcc9a22f" -CdId "21054190-afgt-14b6-ac10-558fgrc9b34g"
```

### Dismount ISO from VM

```powershell
Dismount-XoVirtualMachineCD -Session $Session -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
```

### Delete VM

```powershell
Remove-XoVirtualMachine -Session $Session -Id "06754190-adbf-46a9-ab00-558ffcc9a22f" -DeleteDisks:$true
```

### Restart VM

```powershell
Restart-XoVirtualMachine -Session $Session -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
```

### Restore VM From Snapshot

```powershell
Restore-XoVirtualMachineFromSnapshot -Session $Session -SnapshotId "06754190-adbf-46a9-ab00-558ffcc9a22f"
```

### Start VM

```powershell
Start-XoVirtualMachine -Session $Session -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
```

### Start VM on specific Host

```powershell
Start-XoVirtualMachine -Session $Session -Id "06754190-adbf-46a9-ab00-558ffcc9a22f" -HostId "1235a452-84c6-4191-af66-3bc6e484ae09"
```

### Stop VM

```powershell
Stop-XoVirtualMachine -Session $Session -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
```

### Suspend VM

```powershell
Suspend-XoVirtualMachine -Session $Session -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
```

### Resume VM

```powershell
Resume-XoVirtualMachine -Session $Session -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
```

## VM Snapshots

### Take a snapshot

> `Id` is the target VM Id

```powershell
New-XoSnapshot -Session $Session -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
```

### Get Snapshots

```powershell
Get-XoSnapshot -Session $Session
```

### Delete Snapshot

```powershell
Remove-XoSnapshot -Session $Session -SnapshotId "06754190-adbf-46a9-ab00-558ffcc9a22f"
```

## Users

### Get Users

```powershell
Get-XoUser -Session $Session
```

### Get user by Email

```powershell
Get-XoUser -Session $Session -Email "admin@admin.com"
```

### Create new User

```powershell
$password = $(ConvertTo-SecureString -String "MySecurePassword" -Force -AsPlainText)
New-XoUser -Session $Session -Email "admin@admin.com" -Password $password
```

### Create new Admin User

```powershell
$password = $(ConvertTo-SecureString -String "MySecurePassword" -Force -AsPlainText)
New-XoUser -Session $Session -Email "admin@admin.com" -IsAdmin -Password $password
```

### Update User

```powershell
$password = $(ConvertTo-SecureString -String "MySecurePassword" -Force -AsPlainText)
Update-XoUser -Session $Session -Email "admin@admin.com" -Password $password
```

### Update Admin User

```powershell
Update-XoUser -Session $Session -Email "admin@admin.com" -IsAdmin
```

### Remove User

```powershell
Remove-XoUser -Session $Session-Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
```

```powershell
Get-XoUser -Session $Session -Email "admin@admin.com" | Remove-XoUser -Session $Session
```

## Tags

### Add tag to an object

```powershell
Add-XoTag -Session $Session -Tag "Critical" -Id "06754190-adbf-46a9-ab00-558ffcc9a22f" -Color "#000000"
```

### Add tag using the Helper function for the colors

```powershell
$Color = $(Get-XoTagColor -TagColorId black).Color
Add-XoTag -Session $Session -Tag "Critical" -Id "06754190-adbf-46a9-ab00-558ffcc9a22f" -Color "$($Color)"
```

### Get Tags

```powershell
Get-XoTag -Session $Session
```

```powershell
Get-XoTag -Session $Session -Tag "Critical"
```

### Update Tag

```powershell
Update-XoTag -Session $Session-Tag "Critical" -Color "#0000ff"
```

### Update Tag using the Helper function for the colors

```powershell
$Color = $(Get-XoTagColor -TagColorId black).Color
Update-XoTag -Session $Session -Tag "Critical" -Color "$($Color)"
```

### Remove Tag from object

```powershell
Remove-XoTag -Session $Session -Tag"Critical" -Id "06754190-adbf-46a9-ab00-558ffcc9a22f"
```

### Get an Extensive List of colors to use with tags

```powershell
Get-XoTagColor
```

## Tasks

### Get all tasks

```powershell
Get-XoTask -Session $Session
```

## Group

### Create a new group

```powershell
New-XoGroup -Session $Session -Name "MyGroup"
```

### Delete a group

```powershell
Remove-XoGroup -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Get all groups

```powershell
Get-XoGroup -Session $Session
```

### Get group by name

```powershell
Get-XoGroup -Session $Session -Name "MyGroup"
```

### Get group by Id

```powershell
Get-XoGroup -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Update Group Name

```powershell
Update-XoGroup -Session $Session -Name "MyNewGroupName"
```

### Add users to group

```powershell
Add-XoGroupUser -Session $Session$ -Id "9ace51e1-dfbd-4617-8db3-88f28974e111" -UserId "06754190-adbf-46a9-ab00-558ffcc9a22f"

Add-XoGroupUser -Session $Session$ -Id "9ace51e1-dfbd-4617-8db3-88f28974e111" -UserId "06754190-adbf-46a9-ab00-558ffcc9a22f","12354190-adbf-46a9-ab00-558ffcc9a21g"
```

### Remove Users From Group

```powershell
Remove-XoGroupUser -Session $Session -Id "9ace51e1-dfbd-4617-8db3-88f28974e111" -UserId "06754190-adbf-46a9-ab00-558ffcc9a22f"
```

## ACL

### Get ACL

```powershell
Get-XoAcl -Session $Session
```

### Add ACL

Where object is te target object (VM, Network, Storage,Etc...) and subject is the user or group

```powershell
New-XoAcl -Session $Session -Subject "8054b324-3c01-4g6a-5b0a-3e8ccdb8c454" -Object "cbdb27va-0ad1-972d-9532-dcg6b7rf95fd" -Action "admin"
```

### Remove ACL

```powershell
Remove-XoAcl -Session $Session -Subject "8054b336-3c07-4f6f-8b0a-3e8ccdb8c454" -Object "cbdb37be-0ad2-972a-9537-ccc6a7ff95fd" -Action "admin"
```

## Remotes

### Get Remotes

```powershell
Get-XoRemote -Session $Session
```

### Test Remotes

```powershell
Test-XoRemote -Session $Session -Id "85eccfa2-5657-4709-9feb-391aaab5c6dd"
```

### Create New Remote

```powershell
New-XoRemote -Session $Session -Name "test" -Url "nfs://10.0.0.99:/mnt/MyShares/test"
```

### Update Remotes

```powershell
Update-XoRemote -Session $Session -Name "New Remote Name"
```

### Remove Remotes

```powershell
Remove-XoRemote -Session $Session -Id "8054b336-3c07-4f6f-8b0a-3e8ccdb8c454"
```

## Server

### Get servers

```powershell
Get-XoServer -Session $Session
```

### Enable Server

```powershell
Enable-XoServer -Session $Session -Id "8054b336-3c07-4f6f-8b0a-3e8ccdb8c454"
```

### Disable Server

```powershell
Disable-XoServer -Session $Session -Id "8054b336-3c07-4f6f-8b0a-3e8ccdb8c454"
```

### Remove Server

```powershell
Remove-XoServer -Session $Session -Id "8054b336-3c07-4f6f-8b0a-3e8ccdb8c454"
```

### Add server

```powershell
$secure = ConvertTo-SecureString -String "password" -AsPlainText -Force
$Creds = [pscredential]::new("username",$secure)
Add-XoServer -Session $Session -Server 10.0.1.10 -Credential $Creds -LabelName "Xen01" -AllowUnauthorizedCerts:$true
```

### Update Server

```powershell
Update-XoServer -Session $Session -Id "19ee9e08-75a3-4aa0-a21b-208e6d779a92" -LabelName "Xen03"
```

## Roles

### Get all roles

```powershell
Get-XoRole -Session $Session
```

## SR

### Get all SRs

```powershell
Get-XoSr -Session $Session
```

### Get SR by Name

```powershell
Get-XoSr -Session $Session -Name "MySR"
```

### Get SR by Id

```powershell
Get-XoSr -Session $Session -Id "19ee9e08-75a3-4aa0-a21b-208e6d779a92"
```

### Add NFS SR

```powershell
$MyHost = Get-XoHost -Session $Session -Name "xen01"
Register-XoSrNfs -Session $Session -HostId $MyHost.Id -Name "MyShare Test" -Descritpion "Test File Share" -Server "10.0.0.9" -ServerPath "/mnt/FileShares/test"
```

### Forget SR

```powershell
Unregister-XoSr -Session $Session -Id "19ee9e08-75a3-4aa0-a21b-208e6d779a92" -Confirm:$false
```


### Remove SR

```powershell
Remove-XoSr -Session $Session -Id "19ee9e08-75a3-4aa0-a21b-208e6d779a92"
```
### Enable SR Maintenance Mode

```powershell
Enable-XoSrMaintenanceMode -Session $Session -Id "a933cb47-fbf7-42a5-af39-abac9fc3feca"
```

### Disable SR Maintenance Mode

```powershell
Disable-XoSrMaintenanceMode -Session $Session -Id "a933cb47-fbf7-42a5-af39-abac9fc3feca"
```

### Scan SR

```powershell
Start-XoSrScan -Session $Session -Id "a933cb47-fbf7-42a5-af39-abac9fc3feca"
```

### Rename SR

```powershell
Rename-XoSr -Session $Session Id "a933cb47-fbf7-42a5-af39-abac9fc3feca" -Name "MySR Test" -Descritpion "Test SR"
```

## Schedule

### Get Schedules

```powershell
Get-XoSchedule -Session $Session
```

### Get Schedule by Name

```powershell
Get-XoSchedule -Session $Session -Name "Daily"
```

### Create new Schedule

```powershell
New-XoSchedule -Session $Session -Cron "0 0 * * *" -Name "Test"
```

### Remove Schedule

```powershell
Remove-XoSchedule -Session $Session -Id "a933cb47-fbf7-42a5-af39-abac9fc3feca"
```

### Update Schedule

```powershell
Update-XoSchedule -Session $Session Id "a933cb47-fbf7-42a5-af39-abac9fc3feca" -Name "New Name"
```

## Pool

### Get Missing patches

```powershell
Get-XoPoolMissingPatch -Session $Session -HostId "9ace51e1-dfbd-4617-8db3-88f28974e111"
```

### Set Default SR

```powershell
Set-XoPoolDefaultSr -Session $Session -SrId "83c69122-1efc-8224-f7d4-c645e86936bc"
```

### Set Pool Master

```powershell
Set-XoPoolMaster -Session $Session -HostId "9ace51e1-dfbd-4617-8db3-88f28974e111"
```
