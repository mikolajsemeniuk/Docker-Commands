# windows-installation
I decided to add this note to avoid facing issues I approach trying get docker on windows up and running.

Using WSL
* Install WSL
* Enable features

### Install WSL
1. `wsl --install` or `wsl --install -d <Distribution Name>` eg. Ubuntu, Debian, Kali

or

1. `dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`
2. `dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`
3. download linux kernel from [direct link](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi) or [microsoft docs](https://docs.microsoft.com/en-us/windows/wsl/install-win10#step-4---download-the-linux-kernel-update-package)
4. `wsl --set-default-version 2`
5. install linux distro [link](https://docs.microsoft.com/en-us/windows/wsl/install-win10#step-6---install-your-linux-distribution-of-choice)

### Enable features
1. run `Turn Windows features on or off` as administrator
2. Enable `Windows Hypervisor Platform`
3. Enable `Windows Subsystem for Linux`
4. Enable `Virtual Machine Platform`
5. Click `OK`

### Check virtualization
run `Task Manager`
go to `Performance Section`
check `Virtualization`, should be `Enabled`
if no go 
