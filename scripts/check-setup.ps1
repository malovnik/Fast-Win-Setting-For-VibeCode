# Скрипт проверки установки всех инструментов
Write-Host "=== Проверка среды разработки ===" -ForegroundColor Green

$AllGood = $true

# Функция для проверки команды
function Test-Command {
    param($Command, $Name)

    try {
        $version = & $Command --version 2>&1 | Select-Object -First 1
        Write-Host "✓ $Name`: " -ForegroundColor Green -NoNewline
        Write-Host $version -ForegroundColor Cyan
        return $true
    } catch {
        Write-Host "✗ $Name не установлен" -ForegroundColor Red
        return $false
    }
}

# Проверка Python
Write-Host "`n--- Python ---" -ForegroundColor Yellow
$AllGood = (Test-Command "python" "Python") -and $AllGood
$AllGood = (Test-Command "pip" "pip") -and $AllGood
if (Get-Command pyenv -ErrorAction SilentlyContinue) {
    Test-Command "pyenv" "pyenv" | Out-Null
    $AllGood = $true
}
if (Get-Command poetry -ErrorAction SilentlyContinue) {
    Test-Command "poetry" "Poetry" | Out-Null
}

# Проверка Node.js
Write-Host "`n--- Node.js ---" -ForegroundColor Yellow
$AllGood = (Test-Command "node" "Node.js") -and $AllGood
$AllGood = (Test-Command "npm" "npm") -and $AllGood
if (Get-Command nvm -ErrorAction SilentlyContinue) {
    Write-Host "✓ nvm установлен" -ForegroundColor Green
}
if (Get-Command pnpm -ErrorAction SilentlyContinue) {
    Test-Command "pnpm" "pnpm" | Out-Null
}

# Проверка Rust
Write-Host "`n--- Rust ---" -ForegroundColor Yellow
$AllGood = (Test-Command "rustc" "Rust") -and $AllGood
$AllGood = (Test-Command "cargo" "Cargo") -and $AllGood
if (Get-Command rustup -ErrorAction SilentlyContinue) {
    Test-Command "rustup" "rustup" | Out-Null
}

# Проверка Git
Write-Host "`n--- Git ---" -ForegroundColor Yellow
$AllGood = (Test-Command "git" "Git") -and $AllGood

# Проверка директорий
Write-Host "`n--- Структура директорий ---" -ForegroundColor Yellow
$DevToolsRoot = "C:\DevTools"
if (Test-Path $DevToolsRoot) {
    Write-Host "✓ DevTools директория существует: $DevToolsRoot" -ForegroundColor Green

    $SubDirs = @(
        "$DevToolsRoot\Python",
        "$DevToolsRoot\Node",
        "$DevToolsRoot\Rust"
    )

    foreach ($Dir in $SubDirs) {
        if (Test-Path $Dir) {
            Write-Host "  ✓ $Dir" -ForegroundColor Cyan
        } else {
            Write-Host "  ✗ $Dir не существует" -ForegroundColor Red
            $AllGood = $false
        }
    }
} else {
    Write-Host "✗ DevTools директория не найдена" -ForegroundColor Red
    Write-Host "  Запустите setup-dev-env.ps1 для создания" -ForegroundColor Yellow
    $AllGood = $false
}

# Проверка переменных окружения
Write-Host "`n--- Переменные окружения ---" -ForegroundColor Yellow
$EnvVars = @{
    "PYENV_HOME" = "C:\DevTools\Python\pyenv"
    "CARGO_HOME" = "C:\DevTools\Rust\cargo"
    "PNPM_HOME" = "C:\DevTools\Node\pnpm-store"
}

foreach ($var in $EnvVars.GetEnumerator()) {
    $value = [Environment]::GetEnvironmentVariable($var.Key, "User")
    if ($value) {
        Write-Host "✓ $($var.Key): $value" -ForegroundColor Green
    } else {
        Write-Host "✗ $($var.Key) не установлена" -ForegroundColor Yellow
    }
}

# Проверка VSCode
Write-Host "`n--- VSCode ---" -ForegroundColor Yellow
if (Get-Command code -ErrorAction SilentlyContinue) {
    Write-Host "✓ VSCode установлен" -ForegroundColor Green
    if (Test-Path ".vscode\settings.json") {
        Write-Host "✓ Конфигурация VSCode найдена" -ForegroundColor Green
    }
} else {
    Write-Host "! VSCode не найден в PATH" -ForegroundColor Yellow
}

# Итог
Write-Host "`n" -NoNewline
if ($AllGood) {
    Write-Host "=== ✓✓✓ Все основные инструменты установлены! ✓✓✓ ===" -ForegroundColor Green
} else {
    Write-Host "=== ! Некоторые инструменты отсутствуют ===" -ForegroundColor Yellow
    Write-Host "Запустите setup-dev-env.ps1 для установки" -ForegroundColor Cyan
}

# Дополнительная информация
Write-Host "`n--- Полезные команды ---" -ForegroundColor Yellow
Write-Host "  Инициализация проекта: .\init-project.ps1" -ForegroundColor Cyan
Write-Host "  Шпаргалка: cat CHEATSHEET.md" -ForegroundColor Cyan
Write-Host "  Документация: cat README.md" -ForegroundColor Cyan
