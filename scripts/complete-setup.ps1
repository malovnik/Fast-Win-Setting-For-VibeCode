# Complete setup - final configuration
Write-Host "=== Completing Setup ===" -ForegroundColor Green

# Reload PATH to get all new tools
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 1. Setup pnpm
Write-Host "`n[1/5] Setting up pnpm..." -ForegroundColor Yellow
try {
    pnpm setup --force 2>&1 | Out-Null
    Write-Host "[OK] pnpm setup complete" -ForegroundColor Green
} catch {
    Write-Host "[SKIP] pnpm already configured" -ForegroundColor Cyan
}

# Configure pnpm store
pnpm config set store-dir "C:\DevTools\Node\pnpm-store"
Write-Host "[OK] pnpm store configured" -ForegroundColor Green

# Reload PATH again
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 2. Setup Rust default toolchain
Write-Host "`n[2/5] Setting up Rust..." -ForegroundColor Yellow
rustup default stable
Write-Host "[OK] Rust stable set as default" -ForegroundColor Green

# 3. Install Python utilities
Write-Host "`n[3/5] Installing Python utilities..." -ForegroundColor Yellow
python -m pip install --upgrade pip --quiet
Write-Host "  - pip upgraded" -ForegroundColor Cyan

python -m pip install pipx --quiet
Write-Host "  - pipx installed" -ForegroundColor Cyan

python -m pipx ensurepath
Write-Host "  - pipx path configured" -ForegroundColor Cyan

# Install tools via pipx
python -m pipx install poetry --quiet
Write-Host "  - poetry installed" -ForegroundColor Cyan

python -m pipx install black --quiet
Write-Host "  - black installed" -ForegroundColor Cyan

python -m pipx install ruff --quiet
Write-Host "  - ruff installed" -ForegroundColor Cyan

python -m pipx install mypy --quiet
Write-Host "  - mypy installed" -ForegroundColor Cyan

Write-Host "[OK] Python utilities installed" -ForegroundColor Green

# 4. Install Node utilities
Write-Host "`n[4/5] Installing Node.js utilities..." -ForegroundColor Yellow
pnpm add -g typescript tsx eslint prettier --silent
Write-Host "[OK] Node.js utilities installed" -ForegroundColor Green

# 5. Verify everything
Write-Host "`n[5/5] Verifying installation..." -ForegroundColor Yellow

# Reload PATH one more time
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "`n=== Verification ===" -ForegroundColor Green
Write-Host "Python:     $(python --version 2>&1)" -ForegroundColor Cyan
Write-Host "pip:        $(python -m pip --version 2>&1 | Select-Object -First 1)" -ForegroundColor Cyan
Write-Host "Node.js:    $(node --version 2>&1)" -ForegroundColor Cyan
Write-Host "npm:        $(npm --version 2>&1)" -ForegroundColor Cyan
Write-Host "pnpm:       $(pnpm --version 2>&1)" -ForegroundColor Cyan
Write-Host "Rust:       $(rustc --version 2>&1)" -ForegroundColor Cyan
Write-Host "Cargo:      $(cargo --version 2>&1)" -ForegroundColor Cyan

Write-Host "`n=== Installed Tools ===" -ForegroundColor Green
if (Get-Command poetry -ErrorAction SilentlyContinue) {
    Write-Host "Poetry:     $(poetry --version 2>&1)" -ForegroundColor Cyan
}
if (Get-Command black -ErrorAction SilentlyContinue) {
    Write-Host "Black:      $(black --version 2>&1)" -ForegroundColor Cyan
}
if (Get-Command ruff -ErrorAction SilentlyContinue) {
    Write-Host "Ruff:       $(ruff --version 2>&1)" -ForegroundColor Cyan
}

Write-Host "`n=== Directory Structure ===" -ForegroundColor Green
Write-Host "DevTools:   C:\DevTools" -ForegroundColor Cyan
Write-Host "  Python:   C:\Users\malovnik\scoop\apps\python\current" -ForegroundColor Cyan
Write-Host "  Node.js:  $(Get-Command node -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source)" -ForegroundColor Cyan
Write-Host "  Rust:     C:\Users\malovnik\scoop\persist\rustup\.cargo" -ForegroundColor Cyan
Write-Host "  pnpm:     C:\DevTools\Node\pnpm-store" -ForegroundColor Cyan

Write-Host "`n=== SETUP COMPLETE! ===" -ForegroundColor Green
Write-Host @"

Your development environment is ready!

Next steps:
1. Read QUICKSTART.md for getting started
2. Check CHEATSHEET.md for common commands
3. Explore README.md for full documentation

Example usage:
  Python:  python -m venv .venv && .venv\Scripts\Activate.ps1
  React:   pnpm create vite my-app --template react-ts
  Rust:    cargo new my-project && cd my-project && cargo run

Happy coding! 🚀
"@ -ForegroundColor Cyan
