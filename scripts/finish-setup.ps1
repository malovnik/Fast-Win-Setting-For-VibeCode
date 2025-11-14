# Finish setup - install Python and utilities
Write-Host "=== Finishing setup ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Check what Python versions are available
Write-Host "`nChecking available Python versions..." -ForegroundColor Yellow
$availableVersions = pyenv install --list | Select-String "3\.12\." | ForEach-Object { $_.ToString().Trim() }
$latestPython = $availableVersions | Where-Object { $_ -match '^\s*3\.12\.\d+$' } | Select-Object -Last 1
$latestPython = $latestPython.Trim()

Write-Host "Latest Python 3.12.x version: $latestPython" -ForegroundColor Cyan

# Install Python
Write-Host "`nInstalling Python $latestPython..." -ForegroundColor Yellow
pyenv install $latestPython
pyenv global $latestPython
pyenv rehash

# Reload PATH again after Python install
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "`nInstalling Python utilities..." -ForegroundColor Yellow
python -m pip install --upgrade pip
python -m pip install pipx
python -m pipx ensurepath

# Install Python tools via pipx
Write-Host "`nInstalling Poetry, Black, Ruff, MyPy..." -ForegroundColor Yellow
python -m pipx install poetry
python -m pipx install black
python -m pipx install ruff
python -m pipx install mypy

# Install pnpm
Write-Host "`nInstalling pnpm..." -ForegroundColor Yellow
npm install -g pnpm

# Configure pnpm
$DevToolsRoot = "C:\DevTools"
pnpm config set store-dir "$DevToolsRoot\Node\pnpm-store"

# Install Node.js utilities
Write-Host "`nInstalling Node.js utilities..." -ForegroundColor Yellow
pnpm add -g typescript tsx eslint prettier

Write-Host "`n=== Setup complete! ===" -ForegroundColor Green
Write-Host "`nVerifying installations:" -ForegroundColor Yellow
Write-Host "Python: " -NoNewline; python --version
Write-Host "Node.js: " -NoNewline; node --version
Write-Host "Rust: " -NoNewline; rustc --version
Write-Host "pnpm: " -NoNewline; pnpm --version
Write-Host "Poetry: " -NoNewline; poetry --version

Write-Host "`nAll done! You can now start developing!" -ForegroundColor Green
