@echo off
:: CaggyTools - All-in-One Windows Tools
:: Created by Caggy
:: Version 1.0

setlocal enabledelayedexpansion
chcp 65001 >nul 2>&1
title CaggyTools v1.0

:: ========== AUTO ADMIN CHECK ==========
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Meminta hak administrator...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: ========== MAIN MENU ==========
:menu
cls
color 0B
echo.
echo   +--------------------------------------------------+
echo   ¦                                                  ¦
echo   ¦     ¦¦¦¦¦¦+ ¦¦¦¦¦+  ¦¦¦¦¦¦+  ¦¦¦¦¦¦+ ¦¦+   ¦¦+ ¦
echo   ¦    ¦¦+----+¦¦+--¦¦+¦¦+----+ ¦¦+----+ +¦¦+ ¦¦++ ¦
echo   ¦    ¦¦¦     ¦¦¦¦¦¦¦¦¦¦¦  ¦¦¦+¦¦¦  ¦¦¦+ +¦¦¦¦++  ¦
echo   ¦    ¦¦¦     ¦¦+--¦¦¦¦¦¦   ¦¦¦¦¦¦   ¦¦¦  +¦¦++   ¦
echo   ¦    +¦¦¦¦¦¦+¦¦¦  ¦¦¦+¦¦¦¦¦¦+++¦¦¦¦¦¦++   ¦¦¦    ¦
echo   ¦     +-----++-+  +-+ +-----+  +-----+    +-+    ¦
echo   ¦                                                  ¦
echo   ¦           T O O L S   B Y   C A G G Y           ¦
echo   ¦                                                  ¦
echo   +--------------------------------------------------+
echo.
echo   +-------------------------------------+
echo   ¦         MENU UTAMA CAGGYTOOLS       ¦
echo   ¦-------------------------------------¦
echo   ¦  [1] Aktivasi Windows               ¦
echo   ¦  [2] Stop Update Windows (s/d 2077) ¦
echo   ¦  [3] Aktivasi Microsoft Office      ¦
echo   ¦  [4] Download ^& Install Browser     ¦
echo   ¦  [5] Keluar                         ¦
echo   +-------------------------------------+
echo.
echo   +-------------------------------------+
echo   ¦   CaggyTools by Caggy - v1.0        ¦
echo   +-------------------------------------+
echo.
set /p "pilihan=   Masukkan pilihan [1-5]: "

if "%pilihan%"=="1" goto aktivasi_windows
if "%pilihan%"=="2" goto stop_update
if "%pilihan%"=="3" goto aktivasi_office
if "%pilihan%"=="4" goto browser_menu
if "%pilihan%"=="5" goto keluar
goto menu

:: ========== 1. AKTIVASI WINDOWS ==========
:aktivasi_windows
cls
color 0E
echo.
echo   +--------------------------------------+
echo   ¦       AKTIVASI WINDOWS (MAS)         ¦
echo   +--------------------------------------+
echo.
echo   Sedang menjalankan Microsoft Activation Scripts...
echo   Harap tunggu, proses ini memerlukan koneksi internet.
echo.
powershell -Command "irm https://massgrave.dev/get | iex"
echo.
echo   Proses aktivasi selesai.
echo   Tekan tombol apa saja untuk kembali ke menu utama...
pause >nul
goto menu

:: ========== 2. STOP WINDOWS UPDATE ==========
:stop_update
cls
color 0C
echo.
echo   +----------------------------------------------+
echo   ¦     STOP WINDOWS UPDATE SAMPAI TAHUN 2077    ¦
echo   +----------------------------------------------+
echo.
echo   PERINGATAN: Fitur ini akan menonaktifkan Windows Update
echo   secara permanen hingga tahun 2077!
echo.
echo   +-------------------------------------+
echo   ¦  [Y] Ya, lanjutkan                 ¦
echo   ¦  [N] Tidak, kembali ke menu        ¦
echo   +-------------------------------------+
echo.
set /p "konfirmasi=Pilihan Anda (Y/N): "

if /i "%konfirmasi%"=="Y" (
    echo.
    echo   Sedang menonaktifkan Windows Update...
    
    :: Stop services
    net stop wuauserv >nul 2>&1
    net stop bits >nul 2>&1
    net stop dosvc >nul 2>&1
    
    :: Disable services
    sc config wuauserv start= disabled >nul 2>&1
    sc config bits start= disabled >nul 2>&1
    sc config dosvc start= disabled >nul 2>&1
    
    :: Registry tweaks untuk pause update sampai 2077
    reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "FlightSettingsMaxPauseDays" /t REG_DWORD /d 36525 /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseFeatureUpdatesStartTime" /t REG_SZ /d "2024-01-01T00:00:00" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseFeatureUpdatesEndTime" /t REG_SZ /d "2077-01-01T00:00:00" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseQualityUpdatesStartTime" /t REG_SZ /d "2024-01-01T00:00:00" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseQualityUpdatesEndTime" /t REG_SZ /d "2077-01-01T00:00:00" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesStartTime" /t REG_SZ /d "2024-01-01T00:00:00" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesExpiryTime" /t REG_SZ /d "2077-01-01T00:00:00" /f >nul 2>&1
    
    :: Disable automatic updates
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 1 /f >nul 2>&1
    
    echo.
    echo   ? Windows Update berhasil dinonaktifkan hingga tahun 2077!
) else (
    echo.
    echo   Operasi dibatalkan.
)
echo.
echo   Tekan tombol apa saja untuk kembali ke menu utama...
pause >nul
goto menu

:: ========== 3. AKTIVASI OFFICE ==========
:aktivasi_office
cls
color 0A
echo.
echo   +--------------------------------------+
echo   ¦     AKTIVASI MICROSOFT OFFICE        ¦
echo   +--------------------------------------+
echo.
echo   Sedang menjalankan KeyMS Activation...
echo   Harap tunggu, proses ini memerlukan koneksi internet.
echo.
curl -L keyms.id/aso -o aso.cmd >nul 2>&1
if exist aso.cmd (
    call aso.cmd
    del aso.cmd >nul 2>&1
) else (
    echo   Gagal mendownload script aktivasi. Periksa koneksi internet Anda.
)
echo.
echo   Proses aktivasi Office selesai.
echo   Tekan tombol apa saja untuk kembali ke menu utama...
pause >nul
goto menu

:: ========== 4. BROWSER MENU ==========
:browser_menu
cls
color 0D
echo.
echo   +--------------------------------------+
echo   ¦    DOWNLOAD ^& INSTALL BROWSER        ¦
echo   ¦--------------------------------------¦
echo   ¦  [1] Google Chrome                   ¦
echo   ¦  [2] Brave Browser                   ¦
echo   ¦  [3] Mozilla Firefox                 ¦
echo   ¦  [4] Opera                           ¦
echo   ¦  [5] Vivaldi                         ¦
echo   ¦  [6] Microsoft Edge                  ¦
echo   ¦  [7] Kembali ke Menu Utama           ¦
echo   +--------------------------------------+
echo.
set /p "browser_pilih=Pilih browser [1-7]: "

if "%browser_pilih%"=="1" goto install_chrome
if "%browser_pilih%"=="2" goto install_brave
if "%browser_pilih%"=="3" goto install_firefox
if "%browser_pilih%"=="4" goto install_opera
if "%browser_pilih%"=="5" goto install_vivaldi
if "%browser_pilih%"=="6" goto install_edge
if "%browser_pilih%"=="7" goto menu
goto browser_menu

:: ========== INSTALL GOOGLE CHROME ==========
:install_chrome
cls
color 0D
echo.
echo   +--------------------------------------+
echo   ¦    INSTALL GOOGLE CHROME             ¦
echo   +--------------------------------------+
echo.
echo   Sedang mendownload Google Chrome...
set "temp_dir=%TEMP%\CaggyTools"
if not exist "%temp_dir%" mkdir "%temp_dir%"
curl -L "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -o "%temp_dir%\chrome_installer.exe" >nul 2>&1
echo   Sedang menginstall Google Chrome (silent mode)...
start /wait "" "%temp_dir%\chrome_installer.exe" /silent /install
del "%temp_dir%\chrome_installer.exe" >nul 2>&1
echo   Google Chrome berhasil diinstall!
echo   Tekan tombol apa saja untuk kembali...
pause >nul
goto browser_menu

:: ========== INSTALL BRAVE BROWSER ==========
:install_brave
cls
color 0D
echo.
echo   +--------------------------------------+
echo   ¦    INSTALL BRAVE BROWSER             ¦
echo   +--------------------------------------+
echo.
echo   Sedang mendownload Brave Browser...
set "temp_dir=%TEMP%\CaggyTools"
if not exist "%temp_dir%" mkdir "%temp_dir%"
curl -L "https://laptop-updates.brave.com/latest/winx64" -o "%temp_dir%\brave_installer.exe" >nul 2>&1
echo   Sedang menginstall Brave Browser (silent mode)...
start /wait "" "%temp_dir%\brave_installer.exe" /silent /install
del "%temp_dir%\brave_installer.exe" >nul 2>&1
echo   Brave Browser berhasil diinstall!
echo   Tekan tombol apa saja untuk kembali...
pause >nul
goto browser_menu

:: ========== INSTALL MOZILLA FIREFOX ==========
:install_firefox
cls
color 0D
echo.
echo   +--------------------------------------+
echo   ¦    INSTALL MOZILLA FIREFOX           ¦
echo   +--------------------------------------+
echo.
echo   Sedang mendownload Mozilla Firefox...
set "temp_dir=%TEMP%\CaggyTools"
if not exist "%temp_dir%" mkdir "%temp_dir%"
curl -L "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US" -o "%temp_dir%\firefox_installer.exe" >nul 2>&1
echo   Sedang menginstall Mozilla Firefox (silent mode)...
start /wait "" "%temp_dir%\firefox_installer.exe" /S
del "%temp_dir%\firefox_installer.exe" >nul 2>&1
echo   Mozilla Firefox berhasil diinstall!
echo   Tekan tombol apa saja untuk kembali...
pause >nul
goto browser_menu

:: ========== INSTALL OPERA ==========
:install_opera
cls
color 0D
echo.
echo   +--------------------------------------+
echo   ¦    INSTALL OPERA BROWSER             ¦
echo   +--------------------------------------+
echo.
echo   Sedang mendownload Opera Browser...
set "temp_dir=%TEMP%\CaggyTools"
if not exist "%temp_dir%" mkdir "%temp_dir%"
curl -L "https://get.opera.com/pub/opera/desktop/latest/win/OperaSetup.exe" -o "%temp_dir%\opera_installer.exe" >nul 2>&1
echo   Sedang menginstall Opera Browser (silent mode)...
start /wait "" "%temp_dir%\opera_installer.exe" /silent /allusers=1 /launchopera=0
del "%temp_dir%\opera_installer.exe" >nul 2>&1
echo   Opera Browser berhasil diinstall!
echo   Tekan tombol apa saja untuk kembali...
pause >nul
goto browser_menu

:: ========== INSTALL VIVALDI ==========
:install_vivaldi
cls
color 0D
echo.
echo   +--------------------------------------+
echo   ¦    INSTALL VIVALDI BROWSER           ¦
echo   +--------------------------------------+
echo.
echo   Sedang mendownload Vivaldi Browser...
set "temp_dir=%TEMP%\CaggyTools"
if not exist "%temp_dir%" mkdir "%temp_dir%"
curl -L "https://downloads.vivaldi.com/stable/Vivaldi.latest.exe" -o "%temp_dir%\vivaldi_installer.exe" >nul 2>&1
echo   Sedang menginstall Vivaldi Browser (silent mode)...
start /wait "" "%temp_dir%\vivaldi_installer.exe" --vivaldi-silent --do-not-launch-chrome --system-level
del "%temp_dir%\vivaldi_installer.exe" >nul 2>&1
echo   Vivaldi Browser berhasil diinstall!
echo   Tekan tombol apa saja untuk kembali...
pause >nul
goto browser_menu

:: ========== INSTALL MICROSOFT EDGE ==========
:install_edge
cls
color 0D
echo.
echo   +--------------------------------------+
echo   ¦    INSTALL MICROSOFT EDGE            ¦
echo   +--------------------------------------+
echo.
echo   Sedang mendownload Microsoft Edge...
set "temp_dir=%TEMP%\CaggyTools"
if not exist "%temp_dir%" mkdir "%temp_dir%"
curl -L "https://go.microsoft.com/fwlink/?linkid=2109047&Channel=Stable&language=en&brand=M100" -o "%temp_dir%\edge_installer.exe" >nul 2>&1
echo   Sedang menginstall Microsoft Edge (silent mode)...
start /wait "" "%temp_dir%\edge_installer.exe" /silent /install
del "%temp_dir%\edge_installer.exe" >nul 2>&1
echo   Microsoft Edge berhasil diinstall!
echo   Tekan tombol apa saja untuk kembali...
pause >nul
goto browser_menu

:: ========== 5. KELUAR ==========
:keluar
cls
color 0E
echo.
echo   +--------------------------------------+
echo   ¦                                      ¦
echo   ¦   Terima kasih telah menggunakan     ¦
echo   ¦         CaggyTools v1.0             ¦
echo   ¦                                      ¦
echo   ¦   Script akan ditutup dalam 3 detik  ¦
echo   ¦                                      ¦
echo   +--------------------------------------+
timeout /t 3 >nul
exit