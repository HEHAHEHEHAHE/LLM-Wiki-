@echo off
chcp 65001 >nul
echo 正在停止 4000 埠號的背景預覽伺服器...
for /f "tokens=5" %%a in ('netstat -aon ^| find ":4000" ^| find "LISTENING"') do (
    taskkill /f /pid %%a >nul 2>&1
)
echo ========================================================
echo   AI Video Wiki 伺服器已成功停止！
echo ========================================================
timeout /t 2 >nul
