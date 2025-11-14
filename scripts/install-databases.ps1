# Install Database Tools
Write-Host "=== Installing Database Tools ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# PostgreSQL
Write-Host "`n[1/4] Installing PostgreSQL..." -ForegroundColor Yellow
scoop install postgresql
Write-Host "[OK] PostgreSQL installed" -ForegroundColor Green

# MongoDB
Write-Host "`n[2/4] Installing MongoDB..." -ForegroundColor Yellow
scoop install mongodb
Write-Host "[OK] MongoDB installed" -ForegroundColor Green

# Redis
Write-Host "`n[3/4] Installing Redis..." -ForegroundColor Yellow
scoop install redis
Write-Host "[OK] Redis installed" -ForegroundColor Green

# GUI Tools
Write-Host "`n[4/4] Installing Database GUI tools..." -ForegroundColor Yellow

# MongoDB Compass
Write-Host "  - MongoDB Compass (GUI for MongoDB)" -ForegroundColor Cyan
scoop install mongodb-compass

# pgAdmin (PostgreSQL GUI)
Write-Host "  - pgAdmin (GUI for PostgreSQL)" -ForegroundColor Cyan
scoop install pgadmin4

# RedisInsight
Write-Host "  - RedisInsight (GUI for Redis)" -ForegroundColor Cyan
scoop install redisinsight

Write-Host "`n[OK] All databases installed!" -ForegroundColor Green

Write-Host "`n=== Quick Start ===" -ForegroundColor Yellow
Write-Host "`nPostgreSQL:" -ForegroundColor Cyan
Write-Host "  Start: pg_ctl -D `$env:SCOOP\apps\postgresql\current\data start" -ForegroundColor White
Write-Host "  Connect: psql -U postgres" -ForegroundColor White

Write-Host "`nMongoDB:" -ForegroundColor Cyan
Write-Host "  Start: mongod --dbpath=C:\data\db" -ForegroundColor White
Write-Host "  Connect: mongosh" -ForegroundColor White
Write-Host "  GUI: Launch MongoDB Compass" -ForegroundColor White

Write-Host "`nRedis:" -ForegroundColor Cyan
Write-Host "  Start: redis-server" -ForegroundColor White
Write-Host "  Connect: redis-cli" -ForegroundColor White
Write-Host "  GUI: Launch RedisInsight" -ForegroundColor White

Write-Host "`nNote: All databases can be managed via Docker for easier setup!" -ForegroundColor Yellow
