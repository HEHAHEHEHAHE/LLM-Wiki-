@echo off
chcp 65001 >nul
echo 正在停止 AI Video Wiki 伺服器 (Port 4000)...
powershell -NoProfile -Command "$p = (Get-NetTCPConnection -LocalPort 4000 -ErrorAction SilentlyContinue).OwningProcess; if ($p) { Stop-Process -Id $p -Force; Write-Host '已成功關閉背景伺服器！' -ForegroundColor Green } else { Write-Host '目前背景沒有正在運行的伺服器。' -ForegroundColor Yellow }"
timeout /t 2 >nul
exit
