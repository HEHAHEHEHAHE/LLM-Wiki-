@echo off
rem 檢查 Port 4000 是否已在執行，若無則於背景靜默啟動 Python HTTP 伺服器 (無黑視窗常駐)
powershell -NoProfile -Command "if (!(Get-NetTCPConnection -LocalPort 4000 -ErrorAction SilentlyContinue)) { Start-Process -WindowStyle Hidden python -ArgumentList @('-m', 'http.server', '4000') -WorkingDirectory '%~dp0' ; Start-Sleep -Milliseconds 800 }"

rem 帶入隨機防快取參數 (?t=%random%) 自動開啟瀏覽器，保證每次點開都是最新修改內容
start "" "http://localhost:4000/?t=%random%#/"

exit
