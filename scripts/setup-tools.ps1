Write-Host "Setup tools" -ForegroundColor "Yellow"

function RefreshEnvPath
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# Common tools

choco install -y virtualbox
choco install -y virtualbox-guest-additions-guest.install

choco install -y 7zip
#winget install -e -h --id 7zip.7zip

winget install -e -h --id Microsoft.PowerToys
winget install -e -h --id Obsidian.Obsidian
winget install -e -h --id Logitech.Options
winget install -e -h --id Notepad++.Notepad++
winget install -e -h --id JGraph.Draw

winget install -e -h --id OBSProject.OBSStudio
winget install -e -h --id AntibodySoftware.WizTree
winget install -e -h --id NickeManarin.ScreenToGif

# Comms

winget install -e -h --id Zoom.Zoom
winget install -e -h --id Microsoft.Teams

# Security

winget install -e -h --id DominikReichl.KeePass

# Browsers

winget install -e -h --id Google.Chrome
winget install -e -h --id Mozilla.Firefox

# Prompt

winget install -e -h --id Microsoft.PowerShell
winget install -e -h --id Microsoft.WindowsTerminal -s msstore

winget install -e -h --id JanDeDobbeleer.OhMyPosh

# Dev tools

winget install -e -h --id Postman.Postman
winget install -e -h --id WinMerge.WinMerge

# .net

winget install -e -h --id Microsoft.DotNet.SDK.5
winget install -e -h --id Microsoft.DotNet.SDK.6
winget install -e -h --id Microsoft.DotNet.SDK.7

RefreshEnvPath

# IDEs

winget install -e -h --id Microsoft.VisualStudioCode

RefreshEnvPath

# IDEs: VS Code Extensions

code --install-extension eamodio.gitlens
code --install-extension quicktype.quicktype
code --install-extension vscode-icons-team.vscode-icons
code --install-extension ms-dotnettools.csharp
code --install-extension ms-vscode.powershell

if ($installAndroidStudio) {
    winget install -e -h --id Google.AndroidStudio
}

if ($installVisualStudio) {
    switch ($selectedVisualStudioVersion)
    {
        0 { winget install -e -h --id Microsoft.VisualStudio.2022.Community; Break; }
        1 { winget install -e -h --id Microsoft.VisualStudio.2022.Enterprise; Break; }
        2 { winget install -e -h --id Microsoft.VisualStudio.2022.Professional; Break; }
    }
}

# 
# winget install -e -h --id Microsoft.VisualStudio.2022.Enterprise --silent --override "--wait --quiet --addProductLang En-us --config .vsconfig"
#

winget install -e --id LINQPad.LINQPad.5 # .NET Framework 4.6 → 4.8
winget install -e --id LINQPad.LINQPad.7 # .NET Core 3.1 → .NET 7.0

# Database tools

winget install -e -h --id Microsoft.SQLServerManagementStudio
winget install -e -h --id dbeaver.dbeaver

# Azure tools

winget install -e -h --id Microsoft.AzureCLI
winget install -e -h --id Microsoft.AzureCosmosEmulator
winget install -e -h --id Microsoft.AzureDataStudio
winget install -e -h --id Microsoft.AzureStorageExplorer
winget install -e -h --id Microsoft.AzureStorageEmulator
winget install -e -h --id Microsoft.AzureDataCLI
winget install -e -h --id Microsoft.AzureFunctionsCoreTools
winget install -e -h --id Microsoft.AzureMediaServicesExplorer