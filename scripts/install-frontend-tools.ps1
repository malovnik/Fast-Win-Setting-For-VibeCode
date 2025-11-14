# Install Frontend Development Tools
Write-Host "=== Installing Frontend Tools ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "`n[1/3] Installing Next.js, Tailwind, and build tools..." -ForegroundColor Yellow
pnpm add -g create-next-app tailwindcss postcss autoprefixer
Write-Host "[OK] Next.js and Tailwind installed" -ForegroundColor Green

Write-Host "`n[2/3] Installing UI libraries..." -ForegroundColor Yellow
# These will be installed per-project, but we can install the CLI tools
pnpm add -g @shadcn/ui
Write-Host "[OK] shadcn/ui CLI installed" -ForegroundColor Green

Write-Host "`n[3/3] Installing additional frontend tools..." -ForegroundColor Yellow
pnpm add -g vite create-vite serve
Write-Host "[OK] Vite and serve installed" -ForegroundColor Green

Write-Host "`n[OK] All frontend tools installed!" -ForegroundColor Green

Write-Host "`n=== Quick Start ===" -ForegroundColor Yellow

Write-Host "`nCreate Vite + React app:" -ForegroundColor Cyan
Write-Host "  pnpm create vite my-app --template react" -ForegroundColor White
Write-Host "  pnpm create vite my-app --template react-ts" -ForegroundColor White

Write-Host "`nCreate Next.js app:" -ForegroundColor Cyan
Write-Host "  pnpm create next-app my-app" -ForegroundColor White

Write-Host "`nAdd Tailwind CSS to existing project:" -ForegroundColor Cyan
Write-Host "  pnpm add -D tailwindcss postcss autoprefixer" -ForegroundColor White
Write-Host "  npx tailwindcss init -p" -ForegroundColor White

Write-Host "`nAdd shadcn/ui components:" -ForegroundColor Cyan
Write-Host "  npx shadcn-ui@latest init" -ForegroundColor White
Write-Host "  npx shadcn-ui@latest add button" -ForegroundColor White

Write-Host "`nServe static files:" -ForegroundColor Cyan
Write-Host "  serve ./dist" -ForegroundColor White
