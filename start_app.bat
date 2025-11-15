@echo off
title Windrecorder
mode con cols=70 lines=10 2>nul
color 75
echo.
echo   Initializing Windrecorder, please stand by...
echo.
echo   Please stay in this window until it disappears
echo.

cd /d %~dp0
if exist "hide_CLI_by_python.txt" (
    goto begin
) else (
    goto hide
)

:hide
@REM hide CLI immediately
if "%1"=="h" goto begin
REM Hide window but keep it accessible for debugging
start mshta vbscript:createobject("wscript.shell").run("%~nx0"^&" h",0)^&(window.close) && exit /b

:begin
cd /d %~dp0

echo [DEBUG] Current directory: %CD%
echo [DEBUG] Looking for uv...

REM Try to find uv in common locations
set "UV_PATH="
if exist "%USERPROFILE%\.local\bin\uv.exe" (
    set "UV_PATH=%USERPROFILE%\.local\bin\uv.exe"
    echo [DEBUG] Found uv at: %UV_PATH%
)
if exist "%LOCALAPPDATA%\uv\uv.exe" (
    set "UV_PATH=%LOCALAPPDATA%\uv\uv.exe"
    echo [DEBUG] Found uv at: %UV_PATH%
)
if exist "%USERPROFILE%\.cargo\bin\uv.exe" (
    set "UV_PATH=%USERPROFILE%\.cargo\bin\uv.exe"
    echo [DEBUG] Found uv at: %UV_PATH%
)

REM Check if uv is in PATH
where uv >nul 2>&1
if %errorlevel% equ 0 (
    set "UV_CMD=uv"
    echo [DEBUG] Using uv from PATH
) else if defined UV_PATH (
    set "UV_CMD=%UV_PATH%"
    echo [DEBUG] Using uv from: %UV_CMD%
) else (
    echo [ERROR] uv is not found.
    echo [ERROR] Please install uv by running install_update.bat first.
    echo.
    pause
    exit /b 1
)

echo [DEBUG] Starting Windrecorder with: "%UV_CMD%" run python "%~dp0\main.py"
echo [DEBUG] If you see this message, the application should be starting...
echo [DEBUG] Check the system tray (notification area) for the Windrecorder icon.
echo.
"%UV_CMD%" run python "%~dp0\main.py"
set "EXIT_CODE=%errorlevel%"
if %EXIT_CODE% neq 0 (
    echo.
    echo [ERROR] Failed to start Windrecorder.
    echo [ERROR] Error code: %EXIT_CODE%
    echo.
    pause
    exit /b %EXIT_CODE%
)
