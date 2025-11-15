@echo off
title Windrecorder - installing dependence and updating
mode con cols=150 lines=50

cd /d %~dp0

echo -git: updating repository
git pull

echo -updating dependencies with uv
where uv >nul 2>&1
if %errorlevel% neq 0 (
    echo Installing uv...
    powershell -Command "irm https://astral.sh/uv/install.ps1 | iex"
)

if exist ".venv" (
    echo Using existing virtual environment
) else (
    echo Creating virtual environment with uv...
    uv venv
)

echo Installing dependencies...
uv pip install -e .

color 0e
title Windrecorder - Quick Setup
uv run python "%~dp0\onboard_setting.py"

pause
