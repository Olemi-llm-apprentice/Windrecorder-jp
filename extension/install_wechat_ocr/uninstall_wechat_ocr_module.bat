@echo off
echo Loading extension, please stand by.
echo.

cd /d %~dp0
chcp 65001

:start_install
cls
echo.
echo   Make sure to exit windrecorder before uninstallation.
echo   卸载前请确保退出了 捕风记录仪。
echo.
echo   Enter Y and press Enter to uninstall WeChat OCR module.
echo   输入 Y 后回车卸载 WeChat OCR 模块。
echo.
echo   ================================================================================
echo.
set /p choice=   Please enter the options and press Enter:

if /I "%choice%"=="Y" (
    echo Uninstalling...
    goto uninstall_module
)

goto start_install


@REM -------------------------------------------------
:uninstall_module
cd ..
cd ..
uv pip uninstall wechat-ocr
goto :finish


@REM -------------------------------------------------
:finish
cd ..
cd ..
uv run python "extension\install_wechat_ocr\_uninstall.py"
echo.
echo   The uninstallation script has been completed. 已执行完卸载脚本。
echo.
pause
exit