# Windows Development Environment Setup Script
# Simple version without Unicode characters

Write-Host "=== Setting up development environment ===" -ForegroundColor Green

# Create directory structure
$DevToolsRoot = "C:\DevTools"
$Dirs = @(
    "$DevToolsRoot\Python\pyenv",
    "$DevToolsRoot\Python\virtualenvs",
    "$DevToolsRoot\Node\nvm",
    "$DevToolsRoot\Node\pnpm-store",
    "$DevToolsRoot\Rust\cargo",
    "$DevToolsRoot\Global"
)

Write-Host "Creating directories..." -ForegroundColor Yellow
foreach ($Dir in $Dirs) {
    if (!(Test-Path $Dir)) {
        New-Item -ItemType Directory -Path $Dir -Force | Out-Null
        Write-Host "[OK] Created: $Dir" -ForegroundColor Cyan
    }
}

# Install Scoop
if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "`n=== Installing Scoop ===" -ForegroundColor Yellow
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
    scoop bucket add extras
    scoop bucket add versions
} else {
    Write-Host "`n[OK] Scoop already installed" -ForegroundColor Green
}

# Python: pyenv-win
Write-Host "`n=== Installing Python environment ===" -ForegroundColor Yellow
if (!(Get-Command pyenv -ErrorAction SilentlyContinue)) {
    scoop install pyenv
    Write-Host "[OK] pyenv-win installed" -ForegroundColor Cyan
}

# Node.js: nvm-windows
Write-Host "`n=== Installing Node.js environment ===" -ForegroundColor Yellow
if (!(Get-Command nvm -ErrorAction SilentlyContinue)) {
    scoop install nvm
    Write-Host "[OK] nvm-windows installed" -ForegroundColor Cyan
}

# Rust: rustup
Write-Host "`n=== Installing Rust environment ===" -ForegroundColor Yellow
if (!(Get-Command rustup -ErrorAction SilentlyContinue)) {
    scoop install rustup
    Write-Host "[OK] rustup installed" -ForegroundColor Cyan
}

# Additional tools
Write-Host "`n=== Installing additional tools ===" -ForegroundColor Yellow
$Tools = @('git')
foreach ($Tool in $Tools) {
    if (!(Get-Command $Tool -ErrorAction SilentlyContinue)) {
        scoop install $Tool
        Write-Host "[OK] $Tool installed" -ForegroundColor Cyan
    }
}

Write-Host "`n=== Setting environment variables ===" -ForegroundColor Yellow

# Python
[Environment]::SetEnvironmentVariable("PYENV_HOME", "$DevToolsRoot\Python\pyenv", "User")
[Environment]::SetEnvironmentVariable("PYENV_ROOT", "$DevToolsRoot\Python\pyenv", "User")
[Environment]::SetEnvironmentVariable("WORKON_HOME", "$DevToolsRoot\Python\virtualenvs", "User")

# Node.js / pnpm
[Environment]::SetEnvironmentVariable("NVM_HOME", "$DevToolsRoot\Node\nvm", "User")
[Environment]::SetEnvironmentVariable("NVM_SYMLINK", "$DevToolsRoot\Node\current", "User")
[Environment]::SetEnvironmentVariable("PNPM_HOME", "$DevToolsRoot\Node\pnpm-store", "User")

# Rust
[Environment]::SetEnvironmentVariable("CARGO_HOME", "$DevToolsRoot\Rust\cargo", "User")
[Environment]::SetEnvironmentVariable("RUSTUP_HOME", "$DevToolsRoot\Rust\rustup", "User")

Write-Host "`n[OK] Environment variables configured" -ForegroundColor Green

Write-Host "`n=== Installing language versions ===" -ForegroundColor Yellow

# Reload environment
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Python: install latest stable
Write-Host "`nInstalling Python..." -ForegroundColor Cyan
pyenv install 3.12.0
pyenv global 3.12.0
pyenv rehash

# Node.js: install LTS
Write-Host "`nInstalling Node.js LTS..." -ForegroundColor Cyan
nvm install lts
nvm use lts

# Install pnpm
Write-Host "`nInstalling pnpm..." -ForegroundColor Cyan
npm install -g pnpm
pnpm config set store-dir "$DevToolsRoot\Node\pnpm-store"

# Rust: install stable
Write-Host "`nInstalling Rust stable..." -ForegroundColor Cyan
rustup default stable

Write-Host "`n=== Installing global utilities ===" -ForegroundColor Yellow

# Python utilities
pip install --upgrade pip
pip install pipx
pipx ensurepath

# Install poetry via pipx
pipx install poetry
pipx install black
pipx install ruff
pipx install mypy

# Node.js utilities (via pnpm)
pnpm add -g typescript tsx eslint prettier

Write-Host "`n=== Installation complete! ===" -ForegroundColor Green
Write-Host "`nPlease restart your terminal to apply all changes." -ForegroundColor Yellow
Write-Host "`nTo verify, run: python --version, node --version, rustc --version" -ForegroundColor Cyan
