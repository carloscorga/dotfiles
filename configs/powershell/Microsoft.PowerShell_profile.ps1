New-Alias g goto

function goto {
    param ($location)

    Switch ($location) {
        "pr" { Set-Location -Path "$HOME/projects" }
        default { echo "Invalid location" }
    }
}