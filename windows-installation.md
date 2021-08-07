# windows-installation
I decided to add this note to avoid facing issues I approach trying get docker on windows up and running.

Using WSL
* Install WSL
* Enable features
* Enable virtualization
* Install Docker
* References

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

### Enable virtualization
run `Task Manager`
go to `Performance Section`
check `Virtualization`, should be `Enabled`
if no go to this [link](https://www.minitool.com/news/enable-virtualization-windows-10.html#:~:text=Enable%20Virtualization%20Windows%2010%20in%20BIOS%201%20Power,that%2C%20save%20the%20changes%20and%20reboot%20your%20computer.)

### Install Docker
Install `Docker Desktop for Windows` from this [link](https://docs.docker.com/docker-for-windows/install/)

### References
* [Install WSL2](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
* [Check Virtualization](https://docs.docker.com/docker-for-windows/troubleshoot/#virtualization-must-be-enabled)
* [Install Docker](https://docs.docker.com/docker-for-windows/install/)
* [Install Docker (YouTube)](https://www.youtube.com/watch?v=5RQbdMn04Oc&t=31s)
* [Enable Virtualization in BIOS](https://www.minitool.com/news/enable-virtualization-windows-10.html)
