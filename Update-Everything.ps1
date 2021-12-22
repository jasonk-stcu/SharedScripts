<#
.Synopsis
	Updates all packages it can.
#>

#Requires -Version 3
#Requires -RunAsAdministrator
[CmdletBinding()] Param()

if((Get-Command Get-CimInstance -ErrorAction SilentlyContinue))
{
	Write-Host "$(Get-Unicode.ps1 0x1F199) Updating Windows Store apps" -fore White -back DarkGray
	Get-CimInstance MDM_EnterpriseModernAppManagement_AppManagement01 -Namespace root\cimv2\mdm\dmmap |
		Invoke-CimMethod -MethodName UpdateScanMethod
}
if((Get-Command cup -ErrorAction SilentlyContinue))
{
	Write-Host "$(Get-Unicode.ps1 0x1F199) Updating Chocolatey packages" -fore White -back DarkGray
	cup all -y
}
if((Get-Command npm -ErrorAction SilentlyContinue))
{
	Write-Host "$(Get-Unicode.ps1 0x1F199) Updating npm packages" -fore White -back DarkGray
	npm update -g
}
if((Get-Command dotnet -ErrorAction SilentlyContinue))
{
	Write-Host "$(Get-Unicode.ps1 0x1F199) Updating dotnet global tools" -fore White -back DarkGray
	Get-DotNetGlobalTools.ps1 |foreach {dotnet tool update -g $_.Package}
}
Write-Host "$(Get-Unicode.ps1 0x1F199) Updating PowerShell help" -fore White -back DarkGray
Update-Help
if((Get-Module PSWindowsUpdate -ListAvailable))
{
	Write-Host "$(Get-Unicode.ps1 0x1F199) Updating Windows" -fore White -back DarkGray
	Get-WindowsUpdate
	Install-WindowsUpdate |Format-Table X,Result,KB,Size,Title
}