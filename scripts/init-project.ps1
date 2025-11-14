# Скрипт для инициализации нового проекта в текущей директории
# Использование: .\init-project.ps1 -ProjectType [python|node|rust|mixed]

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet('python', 'node', 'rust', 'mixed')]
    [string]$ProjectType = 'mixed'
)

Write-Host "=== Инициализация проекта ($ProjectType) ===" -ForegroundColor Green

# Python проект
if ($ProjectType -eq 'python' -or $ProjectType -eq 'mixed') {
    Write-Host "`nНастройка Python окружения..." -ForegroundColor Yellow

    # Создаем виртуальное окружение
    if (!(Test-Path ".venv")) {
        python -m venv .venv
        Write-Host "✓ Создано виртуальное окружение .venv" -ForegroundColor Cyan
    }

    # Активируем и устанавливаем poetry
    if (Test-Path "pyproject.toml") {
        & .venv\Scripts\Activate.ps1
        poetry install
        Write-Host "✓ Установлены Python зависимости" -ForegroundColor Cyan
    }

    # Создаем структуру проекта
    $PythonDirs = @('src', 'tests')
    foreach ($Dir in $PythonDirs) {
        if (!(Test-Path $Dir)) {
            New-Item -ItemType Directory -Path $Dir -Force | Out-Null
            New-Item -ItemType File -Path "$Dir\__init__.py" -Force | Out-Null
        }
    }
    Write-Host "✓ Создана структура Python проекта" -ForegroundColor Cyan
}

# Node.js / React проект
if ($ProjectType -eq 'node' -or $ProjectType -eq 'mixed') {
    Write-Host "`nНастройка Node.js окружения..." -ForegroundColor Yellow

    if (Test-Path "package.json") {
        pnpm install
        Write-Host "✓ Установлены Node.js зависимости" -ForegroundColor Cyan
    }

    # Создаем структуру для React/Node
    $NodeDirs = @('src', 'public')
    foreach ($Dir in $NodeDirs) {
        if (!(Test-Path $Dir)) {
            New-Item -ItemType Directory -Path $Dir -Force | Out-Null
        }
    }
    Write-Host "✓ Создана структура Node.js проекта" -ForegroundColor Cyan
}

# Rust проект
if ($ProjectType -eq 'rust' -or $ProjectType -eq 'mixed') {
    Write-Host "`nНастройка Rust окружения..." -ForegroundColor Yellow

    if (!(Test-Path "Cargo.toml")) {
        cargo init --name dev-project
        Write-Host "✓ Инициализирован Rust проект" -ForegroundColor Cyan
    } else {
        cargo build
        Write-Host "✓ Собран Rust проект" -ForegroundColor Cyan
    }
}

Write-Host "`n✓✓✓ Проект инициализирован! ✓✓✓" -ForegroundColor Green
Write-Host "`nСледующие шаги:" -ForegroundColor Yellow
Write-Host "  Python: .venv\Scripts\Activate.ps1" -ForegroundColor Cyan
Write-Host "  Node.js: pnpm dev" -ForegroundColor Cyan
Write-Host "  Rust: cargo run" -ForegroundColor Cyan
