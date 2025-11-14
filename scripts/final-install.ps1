# Final installation - Python and Node utils
Write-Host "=== Final Installation ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Install Python via scoop (simpler than pyenv for now)
Write-Host "`nInstalling Python via Scoop..." -ForegroundColor Yellow
scoop install python

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Install Python utilities
Write-Host "`nInstalling Python utilities..." -ForegroundColor Yellow
python -m pip install --upgrade pip
python -m pip install pipx
python -m pipx ensurepath

# Install Python tools
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

Write-Host "`n=== Installation Complete! ===" -ForegroundColor Green
Write-Host "`nVerifying installations:" -ForegroundColor Yellow
Write-Host "Python: $(python --version)"
Write-Host "Node.js: $(node --version)"
Write-Host "pnpm: $(pnpm --version)"
Write-Host "Rust: $(rustc --version)"

Write-Host "`nAll done! Environment is ready for development!" -ForegroundColor Green
