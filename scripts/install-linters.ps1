# Install Additional Linters and Formatters
Write-Host "=== Installing Linters & Formatters ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Markdown
Write-Host "`n[1/4] Installing Markdown linters..." -ForegroundColor Yellow
pnpm add -g markdownlint-cli markdown-link-check
Write-Host "[OK] Markdown linters installed" -ForegroundColor Green

# YAML
Write-Host "`n[2/4] Installing YAML linter..." -ForegroundColor Yellow
pnpm add -g yaml-lint
Write-Host "[OK] YAML linter installed" -ForegroundColor Green

# JSON
Write-Host "`n[3/4] Installing JSON formatter..." -ForegroundColor Yellow
pnpm add -g json
Write-Host "[OK] JSON tools installed" -ForegroundColor Green

# ShellCheck (for bash scripts)
Write-Host "`n[4/4] Installing ShellCheck..." -ForegroundColor Yellow
scoop install shellcheck
Write-Host "[OK] ShellCheck installed" -ForegroundColor Green

Write-Host "`n[OK] All linters installed!" -ForegroundColor Green

Write-Host "`n=== Usage ===" -ForegroundColor Yellow

Write-Host "`nMarkdown:" -ForegroundColor Cyan
Write-Host "  markdownlint README.md" -ForegroundColor White
Write-Host "  markdown-link-check README.md" -ForegroundColor White

Write-Host "`nYAML:" -ForegroundColor Cyan
Write-Host "  yamllint config.yml" -ForegroundColor White

Write-Host "`nJSON:" -ForegroundColor Cyan
Write-Host "  json -f package.json" -ForegroundColor White

Write-Host "`nShell scripts:" -ForegroundColor Cyan
Write-Host "  shellcheck script.sh" -ForegroundColor White

Write-Host "`nVSCode Extensions (recommended):" -ForegroundColor Yellow
Write-Host "  code --install-extension DavidAnson.vscode-markdownlint" -ForegroundColor White
Write-Host "  code --install-extension redhat.vscode-yaml" -ForegroundColor White
Write-Host "  code --install-extension timonwong.shellcheck" -ForegroundColor White
