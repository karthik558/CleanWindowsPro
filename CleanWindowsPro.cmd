@echo off

@REM [Default variables]
set "developer=KARTHIK LAL"
set "email=dev@karthiklal.in"
set "project=CleanWindowsPro"
set "projectUpperCase=CLEANWINDOWSPRO"
set "created-date=10-06-2022"
set "version=2.6"
set "copy-right=(C) 2022-2024 %developer%"
set "author-website=karthiklal.in"

@REM Set Title is needed cuz of the way the console is displayed
title %project% - %version% - %developer%                                                                     

@REM  .o88b. db      d88888b  .d8b.  d8b   db db   d8b   db d888888b d8b   db d8888b.  .d88b.  db   d8b   db .d8888. d8888b. d8888b.  .d88b.  
@REM d8P  Y8 88      88'     d8' `8b 888o  88 88   I8I   88   `88'   888o  88 88  `8D .8P  Y8. 88   I8I   88 88'  YP 88  `8D 88  `8D .8P  Y8. 
@REM 8P      88      88ooooo 88ooo88 88V8o 88 88   I8I   88    88    88V8o 88 88   88 88    88 88   I8I   88 `8bo.   88oodD' 88oobY' 88    88 
@REM 8b      88      88~~~~~ 88~~~88 88 V8o88 Y8   I8I   88    88    88 V8o88 88   88 88    88 Y8   I8I   88   `Y8b. 88~~~   88`8b   88    88 
@REM Y8b  d8 88booo. 88.     88   88 88  V888 `8b d8'8b d8'   .88.   88  V888 88  .8D `8b  d8' `8b d8'8b d8' db   8D 88      88 `88. `8b  d8' 
@REM  `Y88P' Y88888P Y88888P YP   YP VP   V8P  `8b8' `8d8'  Y888888P VP   V8P Y8888D'  `Y88P'   `8b8' `8d8'  `8888Y' 88      88   YD  `Y88P' 

@REM Check permission to continue the script
goto CHECK_PERMISSIONS

:CHECK_PERMISSIONS
echo Checking for administrator permissions..

@REM Administrator permission is required to run this script
net session >nul 2>&1
if %errorLevel% == 0 (
    color F9
	echo Success, You are running this script as administrator 
    cls
) else ( 
    color FC
	echo Error, You are not running this script as administrator
    echo.
    echo Please run this script as administrator
    echo.
    echo Press any key to exit...
    pause >nul 2>&1
    exit /b 1
)

@REM Abort the script if there is any pending restart/reboot.
if exist %~dp0\restart.txt (
    color FC
    echo Error: A restart is pending. Please restart the computer and run the script again.
    timeout /t 5
    cls
    goto PROMPT_RESTART
) else (
    color F9
    echo Success: No restart is pending...
    timeout /t 2
    goto CONTINUE
)  

:PROMPT_RESTART
    color FC
    echo Do you want to ignore the restart warning and continue the script? (Y/N)
    echo.
    set /p con_Answer=Y/N:

    if /i "%con_Answer%" == "Y" (        
        goto CONTINUE
    ) else (
        echo Aborting the script...
        exit /b 2
    )

:CONTINUE
    color 1F
    echo Continuing the script...
    timeout /t 2
    cls

:MENU
cls
color 1F
@REM [Developer information]
echo Developer       :  %developer%
echo Version         :  %version%
echo Created Date    :  %created-date%
echo Project         :  %project% (Windows Optimzer)
echo Copyright       :  %copy-right%
echo.

echo =======================================
echo   %project% - (Windows Optimzer)
echo =======================================
echo.
echo 1. Fully Automate (Recommended)
echo 2. Clear Temporary Files (Quick-Clean)
echo 3. Create System Restore Point (Recommended)
echo 4. Clear System Restore Points (Not Recommended)
echo 5. Repair Damaged System Files
echo 6. Clear DNS Cache (Recommended)
echo 7. Use Custom DNS Server (Optional)
echo 8. EULA (End User License Agreement)
echo 9. Block Windows Telemetry (Optional)
echo 10. Clear all browser cache and Cookies (Optional)
echo 11. Exit
echo.
set /p option="Enter your selection: "

if "%option%"=="1" goto AUTOMATE
if "%option%"=="2" goto CLEAR-TEMPS
if "%option%"=="3" goto CREATE-SYSTEM-RESTORE-POINT
if "%option%"=="4" goto CLEAR-SYSTEM-RESTORE-POINTS
if "%option%"=="5" goto REPAIR-DAMAGED-SYSTEM-FILES
if "%option%"=="6" goto CLEAR-DNS-CACHE
if "%option%"=="7" goto USE-CUSTOM-DNS
if "%option%"=="8" goto EULA
if "%option%"=="9" goto BLOCK-TELEMETRY
if "%option%"=="10" goto CLEAR-BROWSER-CACHE
if "%option%"=="11" goto END

echo Invalid option.
goto MENU

:AUTOMATE
color F0
@REM Ask user for killing the explorer.exe process
echo Do you want to kill the explorer.exe process? (Y/N)
set /p Explorer_Answer= Y/N:

if /i "%Explorer_Answer%" == "Y" (
    echo Killing explorer.exe process...
    taskkill /f /im explorer.exe
) else (
    echo Not killing explorer.exe process...    
    goto CONTINUE_AUTOMATE
)

:CONTINUE_AUTOMATE
    echo Continuing the script...
    timeout /t 1    

@REM Empty the recycle bin
echo Emptying the recycle bin
powershell -Command "Clear-RecycleBin -Force -ErrorAction Ignore"
timeout /t 1

@REM Clear the DNS cache
echo Clearing DNS cache
ipconfig /flushdns
timeout /t 1

@REM Delete all the .log files
echo Removing .log files
del %windir%\KB*.log /f /q
timeout /t 1

@REM Delete all the files in the system tempory folder
echo Removing System Tempory Files
del /f /s /q %systemdrive%\*.tmp
timeout /t 1

@REM Delete all the files with _mp in the name
echo Removing *_mp files
del /f /s /q %systemdrive%\*._mp
timeout /t 1

@REM Delete all the files with .log in the name
echo Removing *.log files
del /f /s /q %systemdrive%\*.log
timeout /t 1

@REM Delete all the .gid files in the system drive
echo Removing .gid files
del /f /s /q %systemdrive%\*.gid
timeout /t 1

@REM Delete all the files with .chk in the name
echo Removing *.chk files
del /f /s /q %systemdrive%\*.chk 
timeout /t 1

@REM Delete all the files with .old in the name
echo Removing .old Files
del /f /s /q %systemdrive%\*.old 
timeout /t 1

@REM Delete all the files in the recycle bin
echo Removing recycled files
del /f /s /q %systemdrive%\recycled\*.* 
timeout /t 1

@REM Delete all the files with .bak in the name
echo Removing *.bak files
del /f /s /q %windir%\*.bak
timeout /t 1

@REM Delete all the files with .pf in the name
echo Removing prefetch files 
del /f /s /q %windir%\prefetch\*.* 
timeout /t 1

@REM Delete all the files in temp directory
echo Removing temp files
rd /s /q %windir%\temp & md %windir%\temp 
timeout /t 1

@REM Delete all the stored cookies in the system drive
echo Removing default stored cookies
del /f /q %userprofile%\cookies\*.* 
timeout /t 1

@REM Delete all the files in the temporary internet files folder
echo Removing temporary_internet_files 
del /f /s /q "%userprofile%\local settings\temporary internet files\*.*" 
timeout /t 1

@REM Delete all the files in the recent files folder
echo Removing recent files
del /f /s /q "%userprofile%\recent\*.*"
timeout /t 1

@REM Delete all the files in the history folder
echo Removing history files
del /f /s /q "%userprofile%\local settings\history\*.*"
timeout /t 1

@REM Repair System Image (used by sfc /scannow to fix corrupted files)
echo Repairing System Image (using Windows Update if needed)
dism /Online /Cleanup-Image /RestoreHealth
timeout /t 1

@REM Fix all the corrupted files in the system drive
echo Scanning all protected system files, and replacing corrupted files
sfc /scannow
timeout /t 1 

@REM Clear the system restore point
echo Clearing the system restore point
vssadmin delete shadows /all /quiet
timeout /t 1 

@REM Clear the windows run history
echo Clearing the windows run history
timeout /t 1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f

@REM @REM Delete all the files in the temp directory
@REM echo Finally removing the temp_directory
@REM echo Removing local_settings__temp files
@REM del /f /s /q "%userprofile%\local settings\temp\*.*"
@REM timeout /t 1

@REM Start explorer.exe only if it is not running
echo Starting explorer.exe
tasklist /fi "imagename eq explorer.exe" | find /i "explorer.exe" >nul || start explorer.exe
timeout /t 5
echo Done!
goto MENU

:CLEAR-TEMPS
color 1F

@REM Empty the recycle bin
echo Emptying the recycle bin
powershell -Command "Clear-RecycleBin -Force -ErrorAction Ignore"
timeout /t 1

echo Clearing temp, %temp%, %tmp%, recent and prefetch folders
del /f /s /q %systemdrive%\*.tmp
rd /s /q %windir%\temp & md %windir%\temp 
del /f /s /q "%userprofile%\recent\*.*"
del /f /s /q "%userprofile%\local settings\history\*.*"
@REM del /f /s /q "%userprofile%\local settings\temp\*.*"
del /f /s /q %windir%\prefetch\*.* 
timeout /t 5
echo Done!
goto MENU

:CREATE-SYSTEM-RESTORE-POINT
color F0
echo Creating system restore point
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "RestorePointName", 100, 7
timeout /t 5
echo Done!
goto MENU

:CLEAR-SYSTEM-RESTORE-POINTS
color F0
echo Clearing system restore points
vssadmin delete shadows /all /quiet
timeout /t 5
echo Done!
goto MENU

:REPAIR-DAMAGED-SYSTEM-FILES
color F0
echo Repairing damaged system files
dism /Online /Cleanup-Image /RestoreHealth
timeout /t 1
sfc /scannow
timeout /t 5
echo Done!
goto MENU

:CLEAR-DNS-CACHE
color F0
echo Clearing DNS cache
ipconfig /flushdns
timeout /t 5
echo Done!
goto MENU

:USE-CUSTOM-DNS
cls
color 3F
echo Using custom DNS
echo.
echo 1. Google DNS
echo 2. OpenDNS 
echo 3. Adguard DNS
echo 4. Cloudflare DNS 
echo 5. Quad9 DNS
echo 6. Reset to default
echo 7. Back to main menu
echo.
set /p dns=Enter your choice:
if "%dns%"=="1" goto GOOGLE-DNS
if "%dns%"=="2" goto OPENDNS
if "%dns%"=="3" goto ADGUARD-DNS
if "%dns%"=="4" goto CLOUDFLARE-DNS
if "%dns%"=="5" goto QUAD9-DNS
if "%dns%"=="6" goto RESET-DNS
if "%dns%"=="7" goto MENU
echo Invalid option.
goto USE-CUSTOM-DNS

:GOOGLE-DNS
@echo off
setlocal EnableDelayedExpansion
color 3F
set /p "InterfaceName=Enter the name of the interface: "
set Index=
for /f "skip=1" %%a in ('wmic nic where "NetConnectionID='%InterfaceName%'" get Index') do (
    set Index=%%a
    goto :dns
)
:dns
if not defined Index (
    echo Interface not found.
    goto :eof
)
echo Selected network interface: %InterfaceName%
echo.

netsh interface ip set dns name="%InterfaceName%" static 8.8.8.8 primary
netsh interface ip add dns name="%InterfaceName%" 8.8.4.4 index=2

ipconfig /flushdns
echo Quad9-DNS settings applied successfully.
timeout /t 3
goto USE-CUSTOM-DNS

:OPENDNS
@echo off
setlocal EnableDelayedExpansion
color 3F
set /p "InterfaceName=Enter the name of the interface: "
set Index=
for /f "skip=1" %%a in ('wmic nic where "NetConnectionID='%InterfaceName%'" get Index') do (
    set Index=%%a
    goto :dns
)
:dns
if not defined Index (
    echo Interface not found.
    goto :eof
)
echo Selected network interface: %InterfaceName%
echo.

netsh interface ip set dns name="%InterfaceName%" static 208.67.222.222 primary
netsh interface ip add dns name="%InterfaceName%" 208.67.220.220 index=2

ipconfig /flushdns
echo Quad9-DNS settings applied successfully.
timeout /t 3
goto USE-CUSTOM-DNS

:ADGUARD-DNS
@echo off
setlocal EnableDelayedExpansion
color 3F
set /p "InterfaceName=Enter the name of the interface: "
set Index=
for /f "skip=1" %%a in ('wmic nic where "NetConnectionID='%InterfaceName%'" get Index') do (
    set Index=%%a
    goto :dns
)
:dns
if not defined Index (
    echo Interface not found.
    goto :eof
)
echo Selected network interface: %InterfaceName%
echo.

netsh interface ip set dns name="%InterfaceName%" static 94.140.14.14 primary
netsh interface ip add dns name="%InterfaceName%" 94.140.15.15 index=2

ipconfig /flushdns
echo Quad9-DNS settings applied successfully.
timeout /t 3
goto USE-CUSTOM-DNS

:CLOUDFLARE-DNS
@echo off
setlocal EnableDelayedExpansion
color 3F
set /p "InterfaceName=Enter the name of the interface: "
set Index=
for /f "skip=1" %%a in ('wmic nic where "NetConnectionID='%InterfaceName%'" get Index') do (
    set Index=%%a
    goto :dns
)
:dns
if not defined Index (
    echo Interface not found.
    goto :eof
)
echo Selected network interface: %InterfaceName%
echo.

netsh interface ip set dns name="%InterfaceName%" static 1.1.1.1 primary
netsh interface ip add dns name="%InterfaceName%" 1.0.0.1 index=2

ipconfig /flushdns
echo Quad9-DNS settings applied successfully.
timeout /t 3
goto USE-CUSTOM-DNS

:QUAD9-DNS
@echo off
setlocal EnableDelayedExpansion
color 3F
set /p "InterfaceName=Enter the name of the interface: "
set Index=
for /f "skip=1" %%a in ('wmic nic where "NetConnectionID='%InterfaceName%'" get Index') do (
    set Index=%%a
    goto :dns
)
:dns
if not defined Index (
    echo Interface not found.
    goto :eof
)
echo Selected network interface: %InterfaceName%
echo.

netsh interface ip set dns name="%InterfaceName%" static 9.9.9.9 primary
netsh interface ip add dns name="%InterfaceName%" 149.112.112.112 index=2

ipconfig /flushdns
echo Quad9-DNS settings applied successfully.
timeout /t 3
goto USE-CUSTOM-DNS

:RESET-DNS
@echo off
setlocal EnableDelayedExpansion
color 3F
set /p "InterfaceName=Enter the name of the interface: "
set Index=
for /f "skip=1" %%a in ('wmic nic where "NetConnectionID='%InterfaceName%'" get Index') do (
    set Index=%%a
    goto :dns
)
:dns
if not defined Index (
    echo Interface not found.
    goto :eof
)
echo Selected network interface: %InterfaceName%
echo.

netsh interface ip set dns name="%InterfaceName%" source=dhcp

ipconfig /flushdns
cls
echo DNS settings reset successfully.
timeout /t 3
goto USE-CUSTOM-DNS

:EULA
cls
color F0
echo EULA Agreement - Please read the following EULA agreement.
echo.
echo [1] This script is provided as is with no warranty of any kind. The author is not responsible for any damage caused by this script.
echo [2] This script is designed to clean up the Windows operating system.
echo [3] This operation may take a few minutes/hours to complete.
echo [4] Please do not close the console window until the script is finished.
echo [5] This script is fully automated and does not require any user input to complete. (after accepting the EULA)
echo [6] This script will not clean up the following:
echo    [*] Windows Defender
echo    [*] Windows Defender Antivirus
echo    [*] Windows Defender Online
echo    [*] Windows Defender SmartScreen
echo    [*] Windows Defender Trust Center
echo    [*] Windows Defender Web Scan
echo    [*] Windows Firewall
echo.
pause
goto MENU

:BLOCK-TELEMETRY
color F0
echo Blocking Windows Telemetry
echo.
echo [1] Block Windows Telemetry
echo [2] Unblock Windows Telemetry
echo [3] Back to main menu
echo.
set /p telemetry=Enter your choice:
if "%telemetry%"=="1" goto BLOCK-TELEMETRY
if "%telemetry%"=="2" goto BLOCK-TELEMETRY
if "%telemetry%"=="3" goto MENU
echo Invalid option.

:BLOCK-TELEMETRY
@echo off
color F0
echo Blocking Windows Telemetry
echo.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
echo Windows Telemetry blocked successfully.
timeout /t 5
goto MENU

:UNBLOCK-TELEMETRY
@echo off
color F0
echo Unblocking Windows Telemetry
echo.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 1 /f
echo Windows Telemetry unblocked successfully.
timeout /t 5
goto MENU

:CLEAR-BROWSER-CACHE
cls
color F0
echo Clearing all browser cache and cookies
echo.
echo [1] Clear Google Chrome cache and cookies
echo [2] Clear Mozilla Firefox cache and cookies
echo [3] Clear Microsoft Edge cache and cookies
echo [4] Clear Opera cache and cookies
echo [5] Clear all browser cache and cookies
echo [6] Back to main menu
echo.
set /p browser=Enter your choice: 
if "%browser%"=="1" goto CLEAR-CHROME
if "%browser%"=="2" goto CLEAR-FIREFOX
if "%browser%"=="3" goto CLEAR-EDGE
if "%browser%"=="4" goto CLEAR-OPERA
if "%browser%"=="5" goto CLEAR-ALL
if "%browser%"=="6" goto MENU
echo Invalid option.
goto CLEAR-BROWSER-CACHE

:CLEAR-CHROME
@echo off
color F0
echo Clearing Google Chrome cache and cookies
echo.
del /f /s /q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cache\*.*"
del /f /s /q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cookies\*.*"
echo Google Chrome cache and cookies cleared successfully.
timeout /t 5

:CLEAR-FIREFOX
@echo off
color F0
echo Clearing Mozilla Firefox cache and cookies
echo.
del /f /s /q "%userprofile%\AppData\Local\Mozilla\Firefox\Profiles\*.default\Cache\*.*"
del /f /s /q "%userprofile%\AppData\Local\Mozilla\Firefox\Profiles\*.default\Cookies\*.*"
echo Mozilla Firefox cache and cookies cleared successfully.
timeout /t 5

:CLEAR-EDGE
@echo off
color F0
echo Clearing Microsoft Edge cache and cookies
echo.
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Cache\*.*"
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Cookies\*.*"
echo Microsoft Edge cache and cookies cleared successfully.
timeout /t 5

:CLEAR-OPERA
@echo off
color F0
echo Clearing Opera cache and cookies
echo.
del /f /s /q "%userprofile%\AppData\Local\Opera Software\Opera Stable\Cache\*.*"
del /f /s /q "%userprofile%\AppData\Local\Opera Software\Opera Stable\Cookies\*.*"
echo Opera cache and cookies cleared successfully.
timeout /t 5

:CLEAR-ALL
@echo off
color F0
echo Clearing all browser cache and cookies
echo.
del /f /s /q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cache\*.*"
del /f /s /q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cookies\*.*"
del /f /s /q "%userprofile%\AppData\Local\Mozilla\Firefox\Profiles\*.default\Cache\*.*"
del /f /s /q "%userprofile%\AppData\Local\Mozilla\Firefox\Profiles\*.default\Cookies\*.*"
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Cache\*.*"
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Cookies\*.*"
del /f /s /q "%userprofile%\AppData\Local\Opera Software\Opera Stable\Cache\*.*"
del /f /s /q "%userprofile%\AppData\Local\Opera Software\Opera Stable\Cookies\*.*"
echo All browser cache and cookies cleared successfully.
timeout /t 5

:END
@echo off
cls
color 1F
echo =======================================
echo THANK YOU FOR USING %projectUpperCase% TOOL
echo =======================================
echo.
echo - DEVELOPER     :   %developer%
echo - EMAIL         :   %email%
echo - WEBSITE       :   %author-website%
echo - VERSION       :   %version%
echo - CREATED DATE  :   %created-date%
echo.
echo - Opensource Software License agreement for windows distribution system (https://www.gnu.org/licenses/gpl-3.0.en.html)
echo - Copying and distribution of this file, with or without modification, are permitted in any medium without royalty provided the copyright notice and this notice are preserved.
echo - Tools are provided as is without warranty of any kind and the author is not responsible for any damage caused by the use of these tools.
echo - Copyright %copy-right%
echo.
pause