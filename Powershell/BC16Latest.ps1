Write-Host '###### Update Nav Containerhelper! ######' -ForegroundColor Blue
& (Join-Path -Path $PSScriptRoot -ChildPath 'Install-NavContainerHelper.ps1')

Write-Host '###### Create Container with Artifacts ######' -ForegroundColor Blue

New-BCContainer -accept_eula `
    -accept_outdated `
    -containerName "BC16LATEST" `
    -artifactUrl (Get-BCArtifactUrl -type OnPrem -version 16 -country w1) `
    -auth Windows `
    -updateHosts `
    -isolation hyperv

Write-Host 'Thats all Folks' -ForegroundColor Blue
