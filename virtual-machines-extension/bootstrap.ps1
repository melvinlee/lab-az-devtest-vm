
## Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install add-on software
choco install docker-for-windows -y

# VS Code
choco install vscode -y

# Chrome
choco install googlechrome -y 

# Utilities
choco install everything /run-on-system-startup /desktop-shortcut -y

# Add user to docker user group
Add-LocalGroupMember -Group "docker-users" -Member "Developer"

# Enable Hyper-V for Docker
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Enable Container for Docker
Enable-WindowsOptionalFeature -Online -FeatureName Containers -All

Start-Sleep -s 30

# Restart
Restart-Computer -Force