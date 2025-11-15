@echo off
echo Loading extension, please stand by.
echo.

cd /d %~dp0
chcp 65001
cls
cd ..
cd ..

:: extension code below
title Custom webui background - windrecorder
uv run streamlit run "extension\set_custom_webui_background\_webui.py"
pause