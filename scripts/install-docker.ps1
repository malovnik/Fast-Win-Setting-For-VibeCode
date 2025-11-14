# Install Docker Desktop
Write-Host "=== Installing Docker Desktop ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "`nInstalling Docker Desktop..." -ForegroundColor Yellow
Write-Host "Note: Docker Desktop requires WSL2 to be enabled" -ForegroundColor Cyan

# Install Docker Desktop via scoop
scoop bucket add extras
scoop install docker

Write-Host "`n[OK] Docker Desktop installed!" -ForegroundColor Green
Write-Host "`nIMPORTANT: You need to:" -ForegroundColor Yellow
Write-Host "1. Restart your computer" -ForegroundColor Cyan
Write-Host "2. Enable WSL2 if not already enabled:" -ForegroundColor Cyan
Write-Host "   wsl --install" -ForegroundColor White
Write-Host "3. Start Docker Desktop from Start Menu" -ForegroundColor Cyan
Write-Host "`nAfter setup, verify with: docker --version" -ForegroundColor Cyan
