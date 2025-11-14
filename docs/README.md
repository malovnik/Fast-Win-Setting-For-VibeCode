# Development Environment Setup

Оптимизированная среда разработки для Python, Node.js, React, Rust на Windows.

## Быстрый старт

### 1. Установка окружения
```powershell
# Запустите PowerShell от имени администратора
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
.\setup-dev-env.ps1
```

### 2. Структура проекта
```
C:\DevTools\               # Все окружения разработки
├── Python\
│   ├── pyenv\            # Версии Python (управляется pyenv)
│   └── virtualenvs\      # Виртуальные окружения
├── Node\
│   ├── nvm\              # Версии Node.js (управляется nvm)
│   └── pnpm-store\       # Общее хранилище пакетов pnpm
└── Rust\
    └── cargo\            # Cargo home с зависимостями
```

## Использование

### Python
```bash
# Создать виртуальное окружение для проекта
python -m venv .venv

# Активировать (PowerShell)
.venv\Scripts\Activate.ps1

# Активировать (CMD)
.venv\Scripts\activate.bat

# Установить зависимости через Poetry
poetry install
```

### Node.js / React
```bash
# Установить зависимости (pnpm использует общее хранилище)
pnpm install

# Запуск dev-сервера
pnpm dev

# Сборка
pnpm build
```

### Rust
```bash
# Создать новый проект
cargo new my-project

# Сборка
cargo build

# Запуск
cargo run
```

## Переключение версий

### Python
```bash
pyenv versions              # Список установленных версий
pyenv install 3.11.0        # Установить версию
pyenv global 3.12.0         # Установить глобальную версию
pyenv local 3.11.0          # Установить версию для проекта
```

### Node.js
```bash
nvm list                    # Список установленных версий
nvm install 20.0.0          # Установить версию
nvm use 20.0.0              # Использовать версию
```

### Rust
```bash
rustup toolchain list       # Список установленных toolchains
rustup default stable       # Использовать stable
rustup update               # Обновить все toolchains
```

## Преимущества этой конфигурации

1. **Экономия места**: pnpm использует общее хранилище, экономит ~70% места
2. **Изоляция**: Виртуальные окружения изолированы от системы
3. **Версионность**: Легко переключаться между версиями языков
4. **Чистота**: Все окружения в одном месте (C:\DevTools)
5. **Без конфликтов**: Каждый проект использует свои зависимости

## Переменные окружения

Автоматически настроены:
- `PYENV_HOME`, `PYENV_ROOT`, `WORKON_HOME` - для Python
- `NVM_HOME`, `PNPM_HOME` - для Node.js
- `CARGO_HOME`, `RUSTUP_HOME` - для Rust

## Утилиты

### Python
- `black` - форматирование кода
- `ruff` - быстрый линтер
- `mypy` - проверка типов
- `pytest` - тестирование

### Node.js
- `prettier` - форматирование кода
- `eslint` - линтер
- `typescript` - типизация

### Rust
- `cargo` - сборка и управление пакетами
- `rustfmt` - форматирование кода
- `clippy` - линтер

## Рекомендации

1. Всегда используйте виртуальное окружение для Python проектов
2. Используйте pnpm вместо npm для Node.js (экономия места)
3. Держите .venv и node_modules в .gitignore
4. Регулярно обновляйте toolchains: `rustup update`, `pyenv update`
