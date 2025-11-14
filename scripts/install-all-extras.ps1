# Install All Extra Development Tools
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Installing All Extra Dev Tools" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

Write-Host "`nThis will install:" -ForegroundColor Yellow
Write-Host "  1. Docker Desktop" -ForegroundColor Cyan
Write-Host "  2. Databases (PostgreSQL, MongoDB, Redis + GUI tools)" -ForegroundColor Cyan
Write-Host "  3. API Testing Tools (Postman, Insomnia)" -ForegroundColor Cyan
Write-Host "  4. Python Extras (Jupyter, Django, FastAPI, Data Science)" -ForegroundColor Cyan
Write-Host "  5. Frontend Tools (Next.js, Tailwind, shadcn/ui)" -ForegroundColor Cyan
Write-Host "  6. Terminal Tools (Oh My Posh, fzf, bat, ripgrep)" -ForegroundColor Cyan
Write-Host "  7. Linters (Markdown, YAML, JSON, ShellCheck)" -ForegroundColor Cyan
Write-Host "  8. Monitoring Tools (Process Explorer, btop, Wireshark)" -ForegroundColor Cyan

Write-Host "`nEstimated time: 20-30 minutes" -ForegroundColor Yellow
Write-Host "Press Ctrl+C to cancel, or" -ForegroundColor Yellow
$response = Read-Host "Press Enter to continue"

$startTime = Get-Date

# 1. Docker Desktop
Write-Host "`n`n[1/8] ===== Docker Desktop =====" -ForegroundColor Magenta
& "$PSScriptRoot\install-docker.ps1"

# 2. Databases
Write-Host "`n`n[2/8] ===== Databases =====" -ForegroundColor Magenta
& "$PSScriptRoot\install-databases.ps1"

# 3. API Tools
Write-Host "`n`n[3/8] ===== API Tools =====" -ForegroundColor Magenta
& "$PSScriptRoot\install-api-tools.ps1"

# 4. Python Extras
Write-Host "`n`n[4/8] ===== Python Extras =====" -ForegroundColor Magenta
& "$PSScriptRoot\install-python-extras.ps1"

# 5. Frontend Tools
Write-Host "`n`n[5/8] ===== Frontend Tools =====" -ForegroundColor Magenta
& "$PSScriptRoot\install-frontend-tools.ps1"

# 6. Terminal Tools
Write-Host "`n`n[6/8] ===== Terminal Tools =====" -ForegroundColor Magenta
& "$PSScriptRoot\install-terminal-tools.ps1"

# 7. Linters
Write-Host "`n`n[7/8] ===== Linters =====" -ForegroundColor Magenta
& "$PSScriptRoot\install-linters.ps1"

# 8. Monitoring Tools
Write-Host "`n`n[8/8] ===== Monitoring Tools =====" -ForegroundColor Magenta
& "$PSScriptRoot\install-monitoring-tools.ps1"

$endTime = Get-Date
$duration = $endTime - $startTime

Write-Host "`n`n========================================" -ForegroundColor Green
Write-Host "  Installation Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

Write-Host "`nTotal time: $($duration.Minutes) minutes $($duration.Seconds) seconds" -ForegroundColor Cyan

Write-Host "`n=== Next Steps ===" -ForegroundColor Yellow
Write-Host "1. Restart your terminal to refresh PATH" -ForegroundColor Cyan
Write-Host "2. For Docker: Restart computer and enable WSL2" -ForegroundColor Cyan
Write-Host "3. Configure Oh My Posh: notepad `$PROFILE" -ForegroundColor Cyan
Write-Host "4. Install VSCode extensions (see docs)" -ForegroundColor Cyan

Write-Host "`n=== Summary of Installed Tools ===" -ForegroundColor Yellow
Write-Host @"
Docker Desktop          - Container platform
PostgreSQL + pgAdmin    - Relational database
MongoDB + Compass       - NoSQL database
Redis + RedisInsight    - In-memory database
Postman + Insomnia      - API testing
Jupyter Lab             - Interactive notebooks
FastAPI, Django, Flask  - Python web frameworks
pandas, numpy           - Data science
Next.js, Vite           - React frameworks
Tailwind CSS            - Utility CSS
Windows Terminal        - Modern terminal
Oh My Posh              - Beautiful prompt
fzf, bat, ripgrep       - CLI utilities
Markdown/YAML linters   - Code quality
Process Explorer        - System monitoring
btop++                  - Resource monitor
"@ -ForegroundColor Cyan

Write-Host "`nFor documentation, see: docs/README.md" -ForegroundColor Yellow
