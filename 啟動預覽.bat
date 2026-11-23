@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo 正在啟動 AI Video Wiki 本機伺服器...
echo 請在瀏覽器中手動輸入網址: http://localhost:4000
start http://localhost:4000
python -m http.server 4000
pause
