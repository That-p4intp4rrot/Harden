$github = "Windows-Optimize-Harden-Debloat"
$Url = "https://github.com/That-p4intp4rrot/Harden/archive/refs/heads/master.zip"
$scriptname = "sos-optimize-windows.ps1"
$ZipFile = "C:\temp\" + $(Split-Path -Path $Url -Leaf)
$Destination= "C:\temp\"
New-Item "C:\" -Name "temp" -ItemType "directory" -Force
Write-Host "Downloading $Url"
Invoke-WebRequest -Uri $Url -OutFile $ZipFile
$ExtractShell = New-Object -ComObject Shell.Application
$Files = $ExtractShell.Namespace($ZipFile).Items()
Write-Output "Extracting ZIP..... This might take a little while"
$ExtractShell.NameSpace($Destination).CopyHere($Files)
Write-Output "Executing $Scriptname"
Set-Location $Destination\"$github"-master
PowerShell.exe -ExecutionPolicy Bypass -File C:\temp\"$github"-master\"$scriptname"
Write-Output "Finished"

