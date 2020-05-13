param ([String]$licenseFile = '')

Write-Host '###### Update Nav Containerhelper! ######' -ForegroundColor Blue
& (Join-Path -Path $PSScriptRoot -ChildPath 'Install-NavContainerHelper.ps1')


if ($licenseFile -eq '') {
Write-Host '###### You have to provide license Filepath! ######' -ForegroundColor Red  
Exit  
} else {
Write-Host '###### Create Container ######' -ForegroundColor Blue
New-NavContainer -accept_eula `
    -accept_outdated `
    -containerName 'N2018CU29' `
    -imageName 'mcr.microsoft.com/dynamicsnav:2018-cu29' `
    -updateHosts `
    -locale 'da-DK' `
    -isolation 'hyperv' `
    -licenseFile $licenseFile `
    -includeCSide

Write-Host 'Thats all Folks' -ForegroundColor Blue
}