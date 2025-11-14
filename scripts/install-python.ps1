# Install Python 3.12 latest
Write-Host "=== Installing Python ===" -ForegroundColor Green

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Install Python 3.12.7 (known stable version)
Write-Host "Installing Python 3.12.7..." -ForegroundColor Yellow
pyenv install 3.12.7
pyenv global 3.12.7
pyenv rehash

# Reload PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "`nInstalling Python utilities..." -ForegroundColor Yellow
python -m pip install --upgrade pip
python -m pip install pipx
python -m pipx ensurepath

Write-Host "`nInstalling Poetry, Black, Ruff, MyPy..." -ForegroundColor Yellow
python -m pipx install poetry
python -m pipx install black
python -m pipx install ruff
python -m pipx install mypy

Write-Host "`n[OK] Python setup complete!" -ForegroundColor Green
python --version
