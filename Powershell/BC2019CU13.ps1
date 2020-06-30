param ([String]$licenseFile = '')

$licenseFile = $licenseFile.TrimStart('"').TrimEnd('"')

Write-Host '###### Update Nav Containerhelper! ######' -ForegroundColor Blue
& (Join-Path -Path $PSScriptRoot -ChildPath 'Install-NavContainerHelper.ps1')

Write-Host '###### Create Container ######' -ForegroundColor Blue
New-NavContainer -accept_eula `
    -accept_outdated `
    -containerName 'BC14C13' `
    -imageName 'mcr.microsoft.com/businesscentral/onprem:14.13.42648.0-w1' `
    -updateHosts `
    -locale 'da-DK' `
    -isolation 'hyperv' `
    -includeCSide `
    -licenseFile $licenseFile `
    -doNotExportObjectsToText `
    -auth UserPassword

Write-Host 'Thats all Folks' -ForegroundColor Blue
