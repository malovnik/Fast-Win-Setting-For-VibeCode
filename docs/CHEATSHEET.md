# Шпаргалка по командам

## Установка окружения (один раз)
```powershell
# В PowerShell от администратора
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
.\setup-dev-env.ps1
```

## Инициализация проекта
```powershell
# Mixed (Python + Node + Rust)
.\init-project.ps1 -ProjectType mixed

# Только Python
.\init-project.ps1 -ProjectType python

# Только Node.js
.\init-project.ps1 -ProjectType node

# Только Rust
.\init-project.ps1 -ProjectType rust
```

## Python

### Виртуальные окружения
```bash
# Создать
python -m venv .venv

# Активировать (PowerShell)
.venv\Scripts\Activate.ps1

# Активировать (CMD)
.venv\Scripts\activate.bat

# Деактивировать
deactivate
```

### Poetry (рекомендуется)
```bash
# Инициализация
poetry init

# Добавить зависимость
poetry add requests
poetry add --group dev pytest

# Установить все зависимости
poetry install

# Запустить в окружении
poetry run python script.py
poetry run pytest

# Shell в окружении
poetry shell
```

### pip (альтернатива)
```bash
# Установить зависимости
pip install -r requirements.txt

# Заморозить зависимости
pip freeze > requirements.txt
```

### Управление версиями Python
```bash
# Список доступных версий
pyenv install --list

# Установить версию
pyenv install 3.12.0

# Глобальная версия
pyenv global 3.12.0

# Локальная версия (для проекта)
pyenv local 3.11.0

# Посмотреть установленные
pyenv versions
```

## Node.js / React

### pnpm (экономит место!)
```bash
# Установить зависимости
pnpm install

# Добавить пакет
pnpm add react
pnpm add -D typescript  # dev dependency
pnpm add -g eslint      # global

# Удалить пакет
pnpm remove package-name

# Обновить пакеты
pnpm update

# Запуск скриптов
pnpm dev
pnpm build
pnpm test
```

### Управление версиями Node.js
```bash
# Список доступных версий
nvm list available

# Установить версию
nvm install 20.0.0
nvm install lts

# Использовать версию
nvm use 20.0.0
nvm use lts

# Посмотреть установленные
nvm list

# Установить версию по умолчанию
nvm alias default 20.0.0
```

### Создание React приложения
```bash
# Vite (рекомендуется - быстрее)
pnpm create vite my-app --template react
pnpm create vite my-app --template react-ts

# Next.js
pnpm create next-app my-app

# Перейти и установить
cd my-app
pnpm install
pnpm dev
```

## Rust

### Cargo основы
```bash
# Создать проект
cargo new my-project        # бинарный
cargo new my-lib --lib      # библиотека

# Сборка
cargo build                 # debug
cargo build --release       # production

# Запуск
cargo run
cargo run --release

# Тесты
cargo test

# Проверка без сборки
cargo check

# Обновить зависимости
cargo update
```

### Управление toolchains
```bash
# Список установленных
rustup toolchain list

# Установить toolchain
rustup toolchain install stable
rustup toolchain install nightly

# Использовать по умолчанию
rustup default stable

# Для конкретного проекта
rustup override set nightly

# Обновить все
rustup update

# Компоненты
rustup component add rustfmt
rustup component add clippy
```

### Линтинг и форматирование
```bash
# Форматирование
cargo fmt

# Проверка форматирования
cargo fmt -- --check

# Линтер
cargo clippy
cargo clippy -- -D warnings  # fail on warnings
```

## Git

### Базовые команды
```bash
# Инициализация
git init

# Статус
git status

# Добавить файлы
git add .
git add file.txt

# Коммит
git commit -m "message"

# История
git log --oneline

# Ветки
git branch                  # список
git branch feature-name     # создать
git checkout feature-name   # переключиться
git checkout -b new-branch  # создать и переключиться

# Push/Pull
git push origin main
git pull origin main
```

## Полезные алиасы для PowerShell

Добавь в `$PROFILE`:
```powershell
# Открыть профиль
notepad $PROFILE

# Добавь эти строки:
function py { python $args }
function act { .venv\Scripts\Activate.ps1 }
function pn { pnpm $args }
function cr { cargo run $args }

# Git shortcuts
function gs { git status }
function ga { git add $args }
function gc { git commit -m $args }
function gp { git push }
```

## Решение проблем

### Python: ModuleNotFoundError
```bash
# Убедись что активировано окружение
.venv\Scripts\Activate.ps1

# Переустанови зависимости
poetry install
# или
pip install -r requirements.txt
```

### Node: Module not found
```bash
# Очисти кэш и переустанови
pnpm store prune
rm -rf node_modules
pnpm install
```

### Rust: linker error
```bash
# Установи Visual Studio Build Tools
# Или добавь в Cargo.toml:
[target.x86_64-pc-windows-msvc]
linker = "rust-lld.exe"
```

### Permission denied
```powershell
# Запусти PowerShell от администратора
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Переменные окружения

Автоматически настроены после `setup-dev-env.ps1`:
- `PYENV_HOME` → `C:\DevTools\Python\pyenv`
- `NVM_HOME` → `C:\DevTools\Node\nvm`
- `CARGO_HOME` → `C:\DevTools\Rust\cargo`
- `PNPM_HOME` → `C:\DevTools\Node\pnpm-store`

## Экономия места

### pnpm экономит ~70% места
```bash
# Посмотреть статистику хранилища
pnpm store status

# Очистить неиспользуемые пакеты
pnpm store prune
```

### Cargo кэш
```bash
# Очистить target в проекте
cargo clean

# Очистить весь cargo cache (осторожно!)
# rm -rf $env:CARGO_HOME\registry
```

### Python кэш
```bash
# Удалить __pycache__ рекурсивно
Get-ChildItem -Recurse -Directory -Filter __pycache__ | Remove-Item -Recurse -Force
```
