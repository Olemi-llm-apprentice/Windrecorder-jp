@echo off
echo Loading extension, please stand by.
echo.

cd /d %~dp0
chcp 65001

:start_uninstall
cls
echo.
echo   Make sure to exit windrecorder before uninstallation.
echo   卸载前请确保退出了 捕风记录仪。
echo.
echo   Enter Y and press Enter to uninstall the image semantic recognition module.
echo   输入 Y 后回车卸载图像语义识别模块。
echo.
echo   Provide feedback on this experimental feature: 
echo   对该实验性功能提供建议反馈：
echo       https://github.com/yuka-friends/Windrecorder/issues
echo.
echo   ================================================================================
echo.
set /p choice=   Please enter the options and press Enter:

if /I "%choice%"=="Y" (
    echo Uninstalling...
    goto uninstall_module
)

goto start_uninstall


@REM -------------------------------------------------
:uninstall_module
:: 这不是一个干净的卸载，但可以移除掉大部分的容量。
:: This is not a clean uninstall, but it removes most of the capacity.
cd ..
cd ..
uv pip uninstall uform
uv pip uninstall torch
uv pip uninstall torchaudio
uv pip uninstall torchvision

uv run python "extension\install_img_embedding_module\_uninstall.py"
echo.
echo   The uninstallation script has been completed. 已执行完卸载脚本。
echo.
pause
exit