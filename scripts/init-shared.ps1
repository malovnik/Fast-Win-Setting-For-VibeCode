# Initialize shared environments
Write-Host "=== Initializing Shared Environments ===" -ForegroundColor Green

$SharedDir = ".shared"

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Create shared Python venv
Write-Host "`n[1/2] Creating shared Python environment..." -ForegroundColor Yellow

if (!(Test-Path "$SharedDir\venv\common")) {
    python -m venv "$SharedDir\venv\common"
    Write-Host "[OK] Created $SharedDir\venv\common" -ForegroundColor Green

    # Activate and install common packages
    & "$SharedDir\venv\common\Scripts\Activate.ps1"

    Write-Host "Installing common Python packages..." -ForegroundColor Cyan
    pip install --upgrade pip --quiet
    pip install requests --quiet
    pip install pytest --quiet
    pip install black --quiet
    pip install ruff --quiet

    Write-Host "[OK] Common packages installed:" -ForegroundColor Green
    Write-Host "  - requests (HTTP library)" -ForegroundColor Cyan
    Write-Host "  - pytest (testing)" -ForegroundColor Cyan
    Write-Host "  - black (formatting)" -ForegroundColor Cyan
    Write-Host "  - ruff (linting)" -ForegroundColor Cyan

    deactivate
} else {
    Write-Host "[SKIP] Shared venv already exists" -ForegroundColor Cyan
}

# Setup pnpm workspaces
Write-Host "`n[2/2] Setting up pnpm workspace..." -ForegroundColor Yellow

# Check if package.json needs workspace config
$packageJson = Get-Content "package.json" -Raw | ConvertFrom-Json

if (-not $packageJson.workspaces) {
    Write-Host "Adding workspace configuration to package.json..." -ForegroundColor Cyan

    # Read, modify, write package.json
    $json = Get-Content "package.json" -Raw | ConvertFrom-Json
    $json | Add-Member -MemberType NoteProperty -Name "private" -Value $true -Force
    $json | Add-Member -MemberType NoteProperty -Name "workspaces" -Value @("projects/*") -Force

    $json | ConvertTo-Json -Depth 10 | Set-Content "package.json"
    Write-Host "[OK] Workspace configured" -ForegroundColor Green
} else {
    Write-Host "[SKIP] Workspace already configured" -ForegroundColor Cyan
}

# Create projects directory for workspaces
if (!(Test-Path "projects")) {
    New-Item -ItemType Directory -Path "projects" -Force | Out-Null
    Write-Host "[OK] Created 'projects' directory for workspaces" -ForegroundColor Green
}

Write-Host "`n=== Shared Environments Ready! ===" -ForegroundColor Green

Write-Host @"

Shared environments created:
  Python:  .shared\venv\common
  Node.js: pnpm workspace (use 'projects' folder)

Usage:

Python shared venv:
  .shared\venv\common\Scripts\Activate.ps1

Create new workspace project:
  mkdir projects\my-project
  cd projects\my-project
  pnpm init
  pnpm install

Benefits:
  - Save ~70% disk space
  - Faster project initialization
  - Shared dependencies across projects
"@ -ForegroundColor Cyan
