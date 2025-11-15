@echo off
echo Loading extension, please stand by.
echo.

cd /d %~dp0
chcp 65001
cls
cd ..
cd ..

:: extension code below
title Create custom lightbox thumbnail - windrecorder
uv run streamlit run "extension\create_custom_lightbox_thumbnail_image\_webui.py"
pause