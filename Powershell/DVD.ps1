param([String]$licenseFile = '', [String]$DVDPath = '', [String]$DvdCountry = '')
Write-Host '###### Update Nav Containerhelper! ######' -ForegroundColor Blue
& (Join-Path -Path $PSScriptRoot -ChildPath 'Install-NavContainerHelper.ps1')

if ($DVDPath -eq '') {
    Write-Host '###### You have to provide a DVD Path ######' -ForegroundColor Red
    exit
} 

if ($DvdCountry -eq '') {
    Write-Host '###### You have to provide a DVD Country ######' -ForegroundColor Red
    exit
} 

if ($licenseFile -eq '') {
    Write-Host '###### You have to provide a License Filepath ######' -ForegroundColor Red
    exit
} 

if (!(Get-Item -Path (Join-Path $DVDPath -ChildPath 'Prerequisite Components\microsoft-windows-netfx3-ondemand-package.cab'))) {    
    Write-Host '###### You miss the prerequisite netfx3! ######' -ForegroundColor Yellow
    Write-Host '###### Try to get it for you! ######' -ForegroundColor Yellow
    Copy-Item -Path "N:\MS Nav\Tools\.NET FX 3\microsoft-windows-netfx3-ondemand-package.cab" -Destination Join-Path $DVDPath -ChildPath 'Prerequisite Components\' -ErrorAction Stop
}

Write-Host '###### Create Container ######' -ForegroundColor Blue
New-NavContainer -accept_eula `
    -containerName DVDNAV `
    -navDvdPath $DVDPath `
    -navDvdCountry $DvdCountry `
    -updateHosts `
    -includeCSide `
    -isolation 'hyperv' `
    -licenseFile $licenseFile `
    -useGenericImage 'mcr.microsoft.com/dynamicsnav:generic-ltsc2016' `
    -donotExportObjectsTotext
    
Write-Host 'Thats all Folks' -ForegroundColor Blue