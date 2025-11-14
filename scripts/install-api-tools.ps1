# Install API Testing Tools
Write-Host "=== Installing API Testing Tools ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Postman
Write-Host "`n[1/2] Installing Postman..." -ForegroundColor Yellow
scoop bucket add extras
scoop install postman
Write-Host "[OK] Postman installed" -ForegroundColor Green

# Insomnia (alternative)
Write-Host "`n[2/2] Installing Insomnia..." -ForegroundColor Yellow
scoop install insomnia
Write-Host "[OK] Insomnia installed" -ForegroundColor Green

Write-Host "`n[OK] API tools installed!" -ForegroundColor Green

Write-Host "`n=== Usage ===" -ForegroundColor Yellow
Write-Host "Postman: Launch from Start Menu" -ForegroundColor Cyan
Write-Host "Insomnia: Launch from Start Menu" -ForegroundColor Cyan
Write-Host "`nFor VSCode, install Thunder Client extension:" -ForegroundColor Cyan
Write-Host "  code --install-extension rangav.vscode-thunder-client" -ForegroundColor White
