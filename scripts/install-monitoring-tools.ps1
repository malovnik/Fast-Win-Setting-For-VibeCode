# Install System Monitoring and Debugging Tools
Write-Host "=== Installing Monitoring & Debug Tools ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Process Explorer
Write-Host "`n[1/4] Installing Process Explorer..." -ForegroundColor Yellow
scoop install sysinternals
Write-Host "[OK] Sysinternals Suite installed (includes Process Explorer, Process Monitor, etc.)" -ForegroundColor Green

# htop equivalent for Windows
Write-Host "`n[2/4] Installing btop++ (system monitor)..." -ForegroundColor Yellow
scoop install btop
Write-Host "[OK] btop++ installed" -ForegroundColor Green

# Network monitoring
Write-Host "`n[3/4] Installing Wireshark (network analyzer)..." -ForegroundColor Yellow
scoop install wireshark
Write-Host "[OK] Wireshark installed" -ForegroundColor Green

# Performance testing
Write-Host "`n[4/4] Installing k6 (load testing)..." -ForegroundColor Yellow
scoop install k6
Write-Host "[OK] k6 installed" -ForegroundColor Green

Write-Host "`n[OK] All monitoring tools installed!" -ForegroundColor Green

Write-Host "`n=== Usage ===" -ForegroundColor Yellow

Write-Host "`nProcess Explorer:" -ForegroundColor Cyan
Write-Host "  Launch from Start Menu" -ForegroundColor White
Write-Host "  Better Task Manager with detailed process info" -ForegroundColor White

Write-Host "`nProcess Monitor:" -ForegroundColor Cyan
Write-Host "  Launch procmon from command line" -ForegroundColor White
Write-Host "  Real-time file, registry, and process monitoring" -ForegroundColor White

Write-Host "`nbtop++:" -ForegroundColor Cyan
Write-Host "  btop" -ForegroundColor White
Write-Host "  Beautiful system resource monitor" -ForegroundColor White

Write-Host "`nWireshark:" -ForegroundColor Cyan
Write-Host "  Launch from Start Menu" -ForegroundColor White
Write-Host "  Network packet analyzer" -ForegroundColor White

Write-Host "`nk6 (load testing):" -ForegroundColor Cyan
Write-Host "  k6 run script.js" -ForegroundColor White
Write-Host "  Performance and load testing tool" -ForegroundColor White

Write-Host "`nAll Sysinternals tools available:" -ForegroundColor Yellow
Write-Host "  procexp     - Process Explorer" -ForegroundColor Cyan
Write-Host "  procmon     - Process Monitor" -ForegroundColor Cyan
Write-Host "  autoruns    - Startup programs manager" -ForegroundColor Cyan
Write-Host "  tcpview     - Network connections viewer" -ForegroundColor Cyan
