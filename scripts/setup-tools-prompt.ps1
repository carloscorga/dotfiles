Write-Host "Setup tools - Prompt" -ForegroundColor "Yellow"

# PowerShell 7

winget install -e -h --id Microsoft.PowerShell

# Windows Terminal

winget install -e -h --id Microsoft.WindowsTerminal -s msstore
winget install -e -h --id JanDeDobbeleer.OhMyPosh

RefreshEnvPath