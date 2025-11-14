# Verify and fix installation
Write-Host "=== Verifying Installation ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Setup pnpm
Write-Host "`nSetting up pnpm..." -ForegroundColor Yellow
pnpm setup
pnpm config set store-dir "C:\DevTools\Node\pnpm-store"

# Reload PATH again
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Install global packages
Write-Host "`nInstalling global Node packages..." -ForegroundColor Yellow
pnpm add -g typescript tsx eslint prettier

Write-Host "`n=== Verification ===" -ForegroundColor Green
Write-Host "Python: $(python --version)" -ForegroundColor Cyan
Write-Host "pip: $(python -m pip --version)" -ForegroundColor Cyan
Write-Host "Node.js: $(node --version)" -ForegroundColor Cyan
Write-Host "npm: $(npm --version)" -ForegroundColor Cyan
Write-Host "pnpm: $(pnpm --version)" -ForegroundColor Cyan
Write-Host "Rust: $(rustc --version)" -ForegroundColor Cyan
Write-Host "Cargo: $(cargo --version)" -ForegroundColor Cyan

Write-Host "`n=== Checking tools ===" -ForegroundColor Green
if (Get-Command poetry -ErrorAction SilentlyContinue) {
    Write-Host "Poetry: $(poetry --version)" -ForegroundColor Cyan
} else {
    Write-Host "Poetry: Not found (install with: python -m pipx install poetry)" -ForegroundColor Yellow
}

Write-Host "`n=== Summary ===" -ForegroundColor Green
Write-Host "Installation directory: C:\DevTools" -ForegroundColor Cyan
Write-Host "- Python: C:\Users\malovnik\scoop\apps\python\current" -ForegroundColor Cyan
Write-Host "- Node.js: via nvm" -ForegroundColor Cyan
Write-Host "- Rust: C:\Users\malovnik\scoop\persist\rustup\.cargo" -ForegroundColor Cyan
Write-Host "- pnpm store: C:\DevTools\Node\pnpm-store" -ForegroundColor Cyan

Write-Host "`nAll done! Environment is ready!" -ForegroundColor Green
