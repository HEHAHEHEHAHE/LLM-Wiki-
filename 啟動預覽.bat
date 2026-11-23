@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ========================================================
echo   正在啟動 AI Video-to-Wiki 本機預覽伺服器...
echo   專屬網址: http://localhost:4000
echo ========================================================
start http://localhost:4000
python -m http.server 4000
pause
