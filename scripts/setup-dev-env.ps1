# Windows Development Environment Setup Script
# Для Python, Node.js, React, Rust
# Оптимизированная конфигурация с общими окружениями

Write-Host "=== Настройка среды разработки ===" -ForegroundColor Green

# Создаем структуру директорий
$DevToolsRoot = "C:\DevTools"
$Dirs = @(
    "$DevToolsRoot\Python\pyenv",
    "$DevToolsRoot\Python\virtualenvs",
    "$DevToolsRoot\Node\nvm",
    "$DevToolsRoot\Node\pnpm-store",
    "$DevToolsRoot\Rust\cargo",
    "$DevToolsRoot\Global"
)

foreach ($Dir in $Dirs) {
    if (!(Test-Path $Dir)) {
        New-Item -ItemType Directory -Path $Dir -Force | Out-Null
        Write-Host "✓ Создана директория: $Dir" -ForegroundColor Cyan
    }
}

# Установка Scoop (если не установлен)
if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "`n=== Установка Scoop ===" -ForegroundColor Yellow
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
    scoop bucket add extras
    scoop bucket add versions
} else {
    Write-Host "`n✓ Scoop уже установлен" -ForegroundColor Green
}

# Python: pyenv-win
Write-Host "`n=== Установка Python окружения ===" -ForegroundColor Yellow
if (!(Get-Command pyenv -ErrorAction SilentlyContinue)) {
    scoop install pyenv
    Write-Host "✓ pyenv-win установлен" -ForegroundColor Cyan
}

# Node.js: nvm-windows
Write-Host "`n=== Установка Node.js окружения ===" -ForegroundColor Yellow
if (!(Get-Command nvm -ErrorAction SilentlyContinue)) {
    scoop install nvm
    Write-Host "✓ nvm-windows установлен" -ForegroundColor Cyan
}

# Rust: rustup
Write-Host "`n=== Установка Rust окружения ===" -ForegroundColor Yellow
if (!(Get-Command rustup -ErrorAction SilentlyContinue)) {
    scoop install rustup
    Write-Host "✓ rustup установлен" -ForegroundColor Cyan
}

# Дополнительные утилиты
Write-Host "`n=== Установка дополнительных утилит ===" -ForegroundColor Yellow
$Tools = @('git', 'vscode', 'windows-terminal')
foreach ($Tool in $Tools) {
    if (!(Get-Command $Tool -ErrorAction SilentlyContinue)) {
        scoop install $Tool
        Write-Host "✓ $Tool установлен" -ForegroundColor Cyan
    }
}

Write-Host "`n=== Настройка переменных окружения ===" -ForegroundColor Yellow

# Python
[Environment]::SetEnvironmentVariable("PYENV_HOME", "$DevToolsRoot\Python\pyenv", "User")
[Environment]::SetEnvironmentVariable("PYENV_ROOT", "$DevToolsRoot\Python\pyenv", "User")
[Environment]::SetEnvironmentVariable("WORKON_HOME", "$DevToolsRoot\Python\virtualenvs", "User")

# Node.js / pnpm
[Environment]::SetEnvironmentVariable("NVM_HOME", "$DevToolsRoot\Node\nvm", "User")
[Environment]::SetEnvironmentVariable("NVM_SYMLINK", "$DevToolsRoot\Node\current", "User")
[Environment]::SetEnvironmentVariable("PNPM_HOME", "$DevToolsRoot\Node\pnpm-store", "User")

# Rust
[Environment]::SetEnvironmentVariable("CARGO_HOME", "$DevToolsRoot\Rust\cargo", "User")
[Environment]::SetEnvironmentVariable("RUSTUP_HOME", "$DevToolsRoot\Rust\rustup", "User")

Write-Host "`n✓ Переменные окружения настроены" -ForegroundColor Green

Write-Host "`n=== Установка версий инструментов ===" -ForegroundColor Yellow

# Перезагружаем окружение
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Python: устанавливаем последнюю стабильную версию
Write-Host "`nУстановка Python..." -ForegroundColor Cyan
pyenv install 3.12.0
pyenv global 3.12.0
pyenv rehash

# Node.js: устанавливаем LTS
Write-Host "`nУстановка Node.js LTS..." -ForegroundColor Cyan
nvm install lts
nvm use lts

# Устанавливаем pnpm
Write-Host "`nУстановка pnpm..." -ForegroundColor Cyan
npm install -g pnpm
pnpm config set store-dir "$DevToolsRoot\Node\pnpm-store"

# Rust: устанавливаем stable
Write-Host "`nУстановка Rust stable..." -ForegroundColor Cyan
rustup default stable

Write-Host "`n=== Установка глобальных утилит ===" -ForegroundColor Yellow

# Python утилиты
pip install --upgrade pip
pip install pipx
pipx ensurepath

# Устанавливаем poetry через pipx
pipx install poetry
pipx install black
pipx install ruff
pipx install mypy

# Node.js утилиты (через pnpm)
pnpm add -g typescript tsx eslint prettier

Write-Host "`n✓✓✓ Установка завершена! ✓✓✓" -ForegroundColor Green
Write-Host "`nПерезапустите терминал для применения всех изменений." -ForegroundColor Yellow
Write-Host "`nДля проверки запустите: python --version, node --version, rustc --version" -ForegroundColor Cyan
