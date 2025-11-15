@echo off
echo Loading extension, please stand by.
echo.

cd /d %~dp0
chcp 65001
cls
cd ..
cd ..

uv run python "extension\index_img_embedding_for_all_videofiles\index_img_embedding_for_all_videofiles.py"
pause