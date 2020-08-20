if (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {

    Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition));

    exit
}

Write-Host "Powershell session is running with elevated permission as Administrator" -ForegroundColor Red

# allow execution of scripts
Set-Executionpolicy Unrestricted -Force

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
