# BC Starter Script
This Repo is made to run with Visual Studio Code or pure Powershell

Please be aware it is an example and you have to adjust Images and things like that to fit your solution...

You most likely have to run VSC as Administrator...

There is a task ready under Terminal -> Run Task that will install you a v16 BC latest Version

Since we are using DOcker make sure you have everything in place:
- HyperV
- Windows Container
- Docker for Desktop in Windows Mode

## BC16Latest.ps1
Task to run: Create BC v16 - Latest!

You will be asked for you AD User password

It will keep navcontainer up2date.

## in case of emergancy 
we have seen so far:
- policy issues with powershell: run in a powershell the following command:
    ```
    Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
    ```
  
  !! WARNING: read carefully the instructions about the implication!
  
  If you want to be on the save side run: 
  
    ```
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```
  
  after you are done with the Container startup

# That's all Folks!
