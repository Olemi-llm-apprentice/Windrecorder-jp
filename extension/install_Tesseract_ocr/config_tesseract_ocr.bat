@echo off
echo Loading extension, please stand by.
echo.

cd /d %~dp0
chcp 65001
cd ..
cd ..

uv run python "extension\install_Tesseract_ocr\_test_install.py"
echo.
echo   The installation script has been completed. 已执行完安装脚本。
echo.
pause
exit