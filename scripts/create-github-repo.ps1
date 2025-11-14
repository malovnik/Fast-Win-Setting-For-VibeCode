# Create GitHub repository and push
Write-Host "=== Creating GitHub Repository ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

$repoName = "Fast-Win-Setting-For-VibeCode"
$description = "🚀 Ultimate Windows Development Environment Setup | Python + Node.js + React + Rust | Automated Installation | Space-Saving (~70%) | Perfect for Students & Developers | One-Click Setup in 10 Minutes"

Write-Host "`nRepository name: $repoName" -ForegroundColor Cyan
Write-Host "Visibility: Public" -ForegroundColor Cyan
Write-Host "Description: $description" -ForegroundColor Cyan

Write-Host "`nCreating repository and pushing..." -ForegroundColor Yellow

gh repo create $repoName --public --source=. --remote=origin --description $description --push

Write-Host "`n[OK] Repository created and code pushed!" -ForegroundColor Green
Write-Host "`nRepository URL: https://github.com/malovnik/$repoName" -ForegroundColor Cyan
