@echo off
echo Loading extension, please stand by.
echo.

cd /d %~dp0
chcp 65001
cd ..
cd ..

:start_rollback
uv run python "extension\install_img_embedding_module\_rollback_old_imgemb_db.py"

@REM -------------------------------------------------
:finish
echo.
echo   The rollback script has been completed. 已执行完回滚脚本。
echo.
pause
exit