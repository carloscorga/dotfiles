Write-Host "Setup tools - IDEs" -ForegroundColor "Yellow"

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

# TODO: How to define options?

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