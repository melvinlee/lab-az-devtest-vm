Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# Install add-on software
choco install docker-for-windows -y

# Visual Studio 2017
choco install visualstudio2017community -y
# Node.js Development
choco install visualstudio2017-workload-node -y
# ASP.Net Web Development
choco install visualstudio2017-workload-netweb -y
# Azure Development
choco install visualstudio2017-workload-azure -y
# .Net Core cross-platform Development
choco install visualstudio2017-workload-netcoretools -y

# .NET Core SDK 2.1
choco install dotnetcore-sdk -y

# VS Code
choco install vscode -y

# Utilities
choco install everything /run-on-system-startup /desktop-shortcut -y

# Enable HyperV for Docker
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V,Containers -All

# Restart
Restart-Computer -Force