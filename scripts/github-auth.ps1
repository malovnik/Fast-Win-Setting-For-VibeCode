# Authenticate with GitHub
Write-Host "=== GitHub Authentication ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "`nThis will open your browser for authentication." -ForegroundColor Yellow
Write-Host "Follow the instructions to authenticate." -ForegroundColor Yellow

# Authenticate via web browser
gh auth login --web

Write-Host "`n[OK] Authentication complete!" -ForegroundColor Green
Write-Host "`nYou can now use GitHub CLI commands:" -ForegroundColor Cyan
Write-Host "  gh repo create" -ForegroundColor Yellow
Write-Host "  gh repo view" -ForegroundColor Yellow
Write-Host "  gh pr create" -ForegroundColor Yellow

# Show auth status
Write-Host "`nCurrent status:" -ForegroundColor Cyan
gh auth status
