Write-Host "Installing/Updating Choco"
if ($null -eq (Get-Command -Name choco.exe -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
    & choco update Chocolatey
}

$all       = (Read-Host "Install all tools: (y/N)").ToLower() -eq 'y'
$default   = $all -or (Read-Host "Install default tools: (y/N)").ToLower() -eq 'y'
$developer = $all -or (Read-Host "Install developer tools: (y/N)").ToLower() -eq 'y'
$paid      = $all -or (Read-Host "Install paid tools: (y/N)").ToLower() -eq 'y'
$gaming    = $all -or (Read-Host "Install gaming tools: (y/N)").ToLower() -eq 'y'
$other     = $all -or (Read-Host "Install other tools: (y/N)").ToLower() -eq 'y'

if ($all) { 
    Write-Host  "Installing all tools" 
}

if ($default) { 
    Write-Host  "Installing default tools" 

    & choco install `
        7zip `
        cascadia-code-nerd-font `
        chocolateygui `
        git `
        microsoft-windows-terminal `
        notepadplusplus `
        oh-my-posh `
        powertoys `
        pwsh `
        sysinternals `
        -y    
}

if ($developer) { 
    Write-Host  "Installing developer tools" 

    & choco install `
        autohotkey.install `
        azure-cli `
        docker-desktop `
        insomnia-rest-api-client
        linqpad `
        nodejs-lts `
        nswagstudio `
        postman `
        vscode `
        -y    
}

if ($paid) { 
    Write-Host  "Installing paid tools" 

    & choco install `
        visualstudio2019enterprise `
        -y    
}

if ($gaming) { 
    Write-Host  "Installing gaming tools" 

    & choco install `
        steam-client `
        -y    
}

if ($other) { 
    Write-Host  "Installing other tools" 

    & choco install `
        microsoft-teams `
        obs-studio `
        obs-virtualcam `
        paint.net `
        -y    
}
