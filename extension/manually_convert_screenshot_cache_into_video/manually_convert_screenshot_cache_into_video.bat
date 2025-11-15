@echo off
echo Loading extension, please stand by.
echo.

cd /d %~dp0
chcp 65001
cls
cd ..
cd ..

:: extension code below
title Windrecorder
uv run python "extension\manually_convert_screenshot_cache_into_video\_main.py"
pause