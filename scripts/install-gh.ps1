# Install GitHub CLI
Write-Host "=== Installing GitHub CLI ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Install gh via scoop
Write-Host "Installing gh (GitHub CLI)..." -ForegroundColor Yellow
scoop install gh

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "`n[OK] GitHub CLI installed!" -ForegroundColor Green
Write-Host "`nNext steps:" -ForegroundColor Yellow
Write-Host "1. Authenticate: gh auth login" -ForegroundColor Cyan
Write-Host "2. Create repo: gh repo create" -ForegroundColor Cyan
Write-Host "3. Check status: gh auth status" -ForegroundColor Cyan

gh --version
