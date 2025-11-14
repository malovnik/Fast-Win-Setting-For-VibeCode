# Install Node.js utilities
Write-Host "=== Installing Node.js utilities ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "Installing pnpm..." -ForegroundColor Yellow
npm install -g pnpm

# Configure pnpm
$DevToolsRoot = "C:\DevTools"
pnpm config set store-dir "$DevToolsRoot\Node\pnpm-store"

Write-Host "`nInstalling TypeScript, ESLint, Prettier..." -ForegroundColor Yellow
pnpm add -g typescript tsx eslint prettier

Write-Host "`n[OK] Node.js utilities installed!" -ForegroundColor Green
node --version
pnpm --version
