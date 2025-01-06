# Create config directories
New-Item -ItemType Directory -Force -Path ".config" | Out-Null
New-Item -ItemType Directory -Force -Path ".config/vscode" | Out-Null

# Export VS Code extensions list
code --list-extensions > .config/extensions.txt

# Move settings.json if it exists
if (Test-Path ".vscode/settings.json") {
    Move-Item ".vscode/settings.json" ".config/vscode/settings.json" -Force
}

# Remove old .vscode directory if it exists
if (Test-Path ".vscode") {
    Remove-Item ".vscode" -Recurse -Force
}

# Create the symbolic link
New-Item -ItemType Junction -Path ".vscode" -Target ".config/vscode" -Force 