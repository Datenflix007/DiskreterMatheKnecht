@echo off
REM --- Diskreter Matheknecht: Lokaler Server mit Python ---
setlocal
set PORT=8000
set HOST=127.0.0.1

REM In das Verzeichnis der BAT-Datei wechseln
pushd "%~dp0"

echo Starte lokalen Webserver auf http://%HOST%:%PORT%/
echo (Beenden mit STRG+C)

REM Browser öffnen
start "" "http://%HOST%:%PORT%/"

REM Erst py-Launcher versuchen, dann python
where py >nul 2>nul
if %errorlevel%==0 (
  py -m http.server %PORT% --bind %HOST%
  goto :end
)

where python >nul 2>nul
if %errorlevel%==0 (
  python -m http.server %PORT% --bind %HOST%
  goto :end
)

echo [FEHLER] Python nicht gefunden. Bitte Python installieren: https://www.python.org/
pause

:end
popd
endlocal
