@echo off
cd /d "%~dp0"
rem Check port 4000 and start hidden Python HTTP server if needed
powershell -NoProfile -Command "if (!(Get-NetTCPConnection -LocalPort 4000 -ErrorAction SilentlyContinue)) { Start-Process -WindowStyle Hidden python -ArgumentList '-m http.server 4000' ; Start-Sleep -Milliseconds 800 }"

rem Open browser with a fresh cache-busting query parameter to force load newest content
start "" "http://localhost:4000/?t=%random%#/"

exit
