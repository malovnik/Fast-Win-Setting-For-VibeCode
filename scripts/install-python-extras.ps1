# Install Extra Python Tools
Write-Host "=== Installing Python Extra Tools ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Activate shared venv if exists, or use global python
if (Test-Path ".shared\venv\common\Scripts\Activate.ps1") {
    Write-Host "Using shared Python environment..." -ForegroundColor Cyan
    & .shared\venv\common\Scripts\Activate.ps1
} else {
    Write-Host "Using global Python..." -ForegroundColor Cyan
}

Write-Host "`n[1/4] Installing Jupyter..." -ForegroundColor Yellow
pip install jupyter jupyterlab notebook --quiet
Write-Host "[OK] Jupyter installed" -ForegroundColor Green

Write-Host "`n[2/4] Installing Web Frameworks..." -ForegroundColor Yellow
pip install fastapi uvicorn django flask --quiet
Write-Host "[OK] FastAPI, Django, Flask installed" -ForegroundColor Green

Write-Host "`n[3/4] Installing Data Science libraries..." -ForegroundColor Yellow
pip install pandas numpy matplotlib seaborn scikit-learn --quiet
Write-Host "[OK] Data science stack installed" -ForegroundColor Green

Write-Host "`n[4/4] Installing Database drivers..." -ForegroundColor Yellow
pip install psycopg2-binary pymongo redis sqlalchemy --quiet
Write-Host "[OK] Database drivers installed" -ForegroundColor Green

Write-Host "`n[OK] All Python extras installed!" -ForegroundColor Green

Write-Host "`n=== Quick Start ===" -ForegroundColor Yellow

Write-Host "`nJupyter Notebook:" -ForegroundColor Cyan
Write-Host "  jupyter notebook" -ForegroundColor White
Write-Host "  jupyter lab" -ForegroundColor White

Write-Host "`nFastAPI:" -ForegroundColor Cyan
Write-Host "  # Create main.py with FastAPI app" -ForegroundColor White
Write-Host "  uvicorn main:app --reload" -ForegroundColor White

Write-Host "`nDjango:" -ForegroundColor Cyan
Write-Host "  django-admin startproject myproject" -ForegroundColor White
Write-Host "  cd myproject && python manage.py runserver" -ForegroundColor White

Write-Host "`nFlask:" -ForegroundColor Cyan
Write-Host "  # Create app.py with Flask app" -ForegroundColor White
Write-Host "  flask run" -ForegroundColor White

Write-Host "`nData Science:" -ForegroundColor Cyan
Write-Host "  python -c 'import pandas; import numpy; print(\"Ready!\")'" -ForegroundColor White
