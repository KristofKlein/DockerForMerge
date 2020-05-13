# DockerForMerge
This repo includes the code shown for my internal Blog post on utilizing Docker when merging old solutions

This Repo is made to run with Visual Studio Code or pure Powershell

All Powershellscripts are accessable via Tasks that support you a bit on using the scripts.

Please be aware it is an example and you have to adjust Images and things like that to fit your solution...

You most likly have to run VSC as Administrator...

## DVD.ps1
Task to run: Create based on DVD

This option is used for e.g. 2013R2 you need to have the DVD ready mounted or unzipped and you have the needed dotfx3 in place. A licence is also needed.
It will keep navcontainer up2date.

## 18CU29.ps1
Task to run: Create 2018CU29!

This option only needs a license file. 
It will keep navcontainer up2date.

## Install-NavContainerHelper.ps1
Installs or Updates NavContainerhelper on it's own

## Get-NavContainerImages.ps1
Task to run: NAV Docker Images!

Allows you to retive all the different Versions of NAV/BC Images our there made available from MS (2015++)
You can apply a Filter for a certain version, or CU or language...


# That's all Folks! 