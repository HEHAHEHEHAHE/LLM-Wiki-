@echo off
chcp 65001 >nul
echo 正在啟動 AI Video Wiki 本機預覽伺服器...
echo 請在瀏覽器中打開: http://localhost:3000
start http://localhost:3000
python -m http.server 3000
pause
