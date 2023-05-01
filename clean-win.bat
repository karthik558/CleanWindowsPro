@echo off

@REM Set console color to (Powershell Blue & White)
color 1F

@REM .##....##....###....########..########.##.....##.####.##....##.........##..........###....##......
@REM .##...##....##.##...##.....##....##....##.....##..##..##...##..........##.........##.##...##......
@REM .##..##....##...##..##.....##....##....##.....##..##..##..##...........##........##...##..##......
@REM .#####....##.....##.########.....##....#########..##..#####....#######.##.......##.....##.##......
@REM .##..##...#########.##...##......##....##.....##..##..##..##...........##.......#########.##......
@REM .##...##..##.....##.##....##.....##....##.....##..##..##...##..........##.......##.....##.##......
@REM .##....##.##.....##.##.....##....##....##.....##.####.##....##.........########.##.....##.########

@REM [Developer information]
echo Developer  :  KARTHIK LAL
echo Version    :  2.3.0 (Stable)
echo Date       :  2022-06-10
echo Project    :  Clean-Windows (Windows Build Directory Cleaner)
echo.

@echo off
@REM Security check [1/3]
@REM Check permission to continue the script
goto check_Permissions

:check_Permissions
echo CHECKING FOR ADMINISTRATOR PERMISSIONS
@REM Administrator permissions are required to run this script.
timeout /t 1

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: You are running this script as an administrator.
    cls
) else (
    echo Error: You are not running this script as an administrator.
    :: Pause the script until the user hits any key.
    pause >nul 2>&1
    exit /b 1
)

@REM Abort the script if there is any pending restart/reboot.
@REM Security check [2/3]
@REM Abort if any restart is pending

@echo off 

if exist %~dp0\restart.txt (
    echo Error: A restart is pending. Please restart the computer and run the script again.
    timeout /t 1
    goto prompt_restart
) else (
    echo Success: No restart is pending.
    timeout /t 1
    goto continue
)  

:prompt_restart
    @REM Ask the user to ignore the restart warning and continue the script.
    echo Do you want to ignore the restart warning and continue the script? (Y/N)
    set /p con_Answer=Y/N:

    if /i "%con_Answer%" == "Y" (
        echo Continuing the script...
        goto continue
    ) else (
        echo Aborting the script...
        exit /b 1
    )

:continue
    echo Continuing the script...
    timeout /t 2
    cls

@REM This script will clean the Windows build directory.
@REM FORCE SCRIPT TO WORK ON FULL SCREEN MODE
:VBSDynamicBuild 

@REM SET TEMP VBS FILE
SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
@REM IF TEMP VBS FILE EXISTS, DELETE IT
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"

@REM ECHO SET WSH SHELL
echo Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
@REM ECHO WSCRIPT SLEEP 1
echo Wscript.Sleep 1                                    >>"%TempVBSFile%"
@REM ECHO WSH SHELL SEND KEYS F11
echo WshShell.SendKeys "{F11}"                            >>"%TempVBSFile%"
@REM ECHO WSCRIPT SLEEP 1
echo Wscript.Sleep 1                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

@REM Set Title is needed cuz of the way the console is displayed
title KARTHIK-V2.2-STABLE
@REM Ofc we need to mention the tool before starting the script
echo YOU ARE USING KARTHIK LAL WINDOWS CLEAN SCRIPT
@REM Timeout is used to make the script wait for 3 seconds
timeout /t 3

@REM Security check [3/3]
@REM EULA Agreement (For the purpose of this script, the EULA is considered to be accepted if the user accepts it.)

@echo off

echo EULA Agreement - Please read the following EULA agreement.

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

@echo off

@REM Accept Prompt
@REM Accept EULA?
echo Do you accept the terms of the EULA? (y/n)
@REM If the user does not accept the EULA, the script will exit.
@REM Accept EULA?
set /p EULA_Answer= Y/N:

if /i "%EULA_Answer%" == "Y" (
    echo EULA accepted. Continuing...
    goto EULA_Accepted
) else (
    echo EULA rejected. Aborting...
    goto EULA_Rejected
)

:EULA_Rejected

echo EULA agreement aborted. Please wait...
timeout /t 1 >nul
echo Progress: [===] 20%
timeout /t 1 >nul
echo Progress: [======] 40%
timeout /t 1 >nul
echo Progress: [==========] 60%
timeout /t 1 >nul
echo Progress: [===============] 80%
timeout /t 1 >nul
echo Progress: [====================] 100%
timeout /t 1 >nul
exit /b 1

:EULA_Accepted

@REM Ask user for killing the explorer.exe process
echo Do you want to kill the explorer.exe process? (Y/N)

set /p Explorer_Answer= Y/N:

if /i "%Explorer_Answer%" == "Y" (
    echo Killing explorer.exe process...
    taskkill /f /im explorer.exe
) else (
    echo Not killing explorer.exe process...
    goto CTL
)

@REM Continue the script
:CTL
@REM Clearing DNS cache
echo Clearing DNS cache
@REM Flush DNS cache
ipconfig /flushdns

@REM Delete all the .log files
echo Removing .log files
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1
@REM Delete all the files with KB in the name
del %windir%\KB*.log /f /q

@REM Delete all the files in the system tempory folder
echo Removing System Tempory Files
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1
@REM Delete all the .tmp files in the system drive
del /f /s /q %systemdrive%\*.tmp

@REM Delete all the files with _mp in the name
echo Removing *_mp files
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1
@REM Delete all the ._mp files in the system drive
del /f /s /q %systemdrive%\*._mp

@REM Delete all the files with .log in the name
echo Removing *.log files
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1
@REM Delete all the .log files in the system drive
del /f /s /q %systemdrive%\*.log 

@REM delete all the files with .gid in the name
echo Removing *.gid files
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1
@REM Delete all the .gid files in the system drive
del /f /s /q %systemdrive%\*.gid

@REM Delete all the files with .chk in the name
echo Removing *.chk files
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1 
@REM Delete all the .chk files in the system drive
del /f /s /q %systemdrive%\*.chk 

@REM Delete all the files with .old in the name
echo Removing .old files
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1 
@REM Delete all the .old files in the system drive
del /f /s /q %systemdrive%\*.old 

@REM Delete all the files in the recycle bin
echo Removing recycled files 
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1 
@REM Delete all the files in the recycle bin
del /f /s /q %systemdrive%\recycled\*.* 

@REM Delete all the files with .bak in the name
echo Removing *.bak files
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1 
@REM Delete all the .bak files in the system drive
del /f /s /q %windir%\*.bak

@REM Delete all the files with .pf in the name
echo Removing prefetch files 
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1 
@REM Delete all the .pf files in the system drive
del /f /s /q %windir%\prefetch\*.* 

@REM Delete all the files in temp directory
echo Removing temp files
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1 
@REM Delete all the temp files from the system drive
rd /s /q %windir%\temp & md %windir%\temp 

@REM Delete all the stored cookies in the system drive
echo Removing default stored cookies
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1 
@REM Clear all the cookies in the user profile
del /f /q %userprofile%\cookies\*.* 

@REM Delete all the files in the temporary internet files folder
echo Removing temporary_internet_files
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1 
@REM Delete all the files in the temporary internet files folder
del /f /s /q "%userprofile%\local settings\temporary internet files\*.*" 

@REM Delete all the files in the recent files folder
echo Removing recent files
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1 
@REM Delete all the files in the recent files folder ~ clearing the recent files folder having some issues on windows 11 (not sure why)
del /f /s /q "%userprofile%\recent\*.*"

@REM Delete all the files in the history folder
echo Removing history files
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1
@REM Delete all the files in the history folder
del /f /s /q "%userprofile%\local settings\history\*.*"

@REM Repair System Image (used by sfc /scannow to fix corrupted files)
echo Repairing System Image (using Windows Update if needed)
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1 
@REM Repair the System Image (using Windows Update if needed)
dism /Online /Cleanup-Image /RestoreHealth

@REM Fix all the corrupted files in the system drive
echo Scanning all protected system files, and replacing corrupted files
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1 
@REM Scan all the protected system files and fix if any are corrupted
sfc /scannow 

@REM Print out the directory tree list
@REM echo Print out directory_tree_list
@REM Timeout is used to make the script wait for 1 seconds
@REM timeout /t 1 
@REM Check all directory_trees and print out the list (just for final view) : can be removed if not needed : also this detects some viruses and trojans (if any)
@REM dir /s 

@REM Clear the system restore point
echo Clearing the system restore point
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1 
@REM Clear all the system restore point shadows from the system drive (save's some space)
vssadmin delete shadows /all /quiet

@REM Clear the windows run history
echo Clearing the windows run history
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f

@REM Clear the console
cls 

@REM Start explorer.exe only if it is not running
echo Starting explorer.exe
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1
tasklist /fi "imagename eq explorer.exe" | find /i "explorer.exe" >nul || start explorer.exe

@REM GREETINGS FROM THE DEVELOPER (KARTHIK LAL) :)

@REM :'######::'########:'########::::::::::'##:::'##::'#######::'##::::'##:
@REM '##... ##: ##.....:: ##.....:::::::::::. ##:'##::'##.... ##: ##:::: ##:
@REM  ##:::..:: ##::::::: ##:::::::::::::::::. ####::: ##:::: ##: ##:::: ##:
@REM . ######:: ######::: ######:::'#######:::. ##:::: ##:::: ##: ##:::: ##:
@REM :..... ##: ##...:::: ##...::::........:::: ##:::: ##:::: ##: ##:::: ##:
@REM '##::: ##: ##::::::: ##::::::::::::::::::: ##:::: ##:::: ##: ##:::: ##:
@REM . ######:: ########: ########::::::::::::: ##::::. #######::. #######::
@REM :......:::........::........::::::::::::::..::::::.......::::.......:::

@REM PRINT REGARDS MESSAGE TO THE USER
echo Thanks for using the script
echo Regards from the developer (KARTHIK-LAL)
echo EMAIL: karthiklal@duck.com

@REM Timeout is used to make the script wait for 6 seconds
timeout /t 4

@REM REMOVING THE TEMP DIRECTORY AT LAST , DUE TO SOME LOOPING ISSUE ON WINDOWS 11 (not sure why)
@REM Delete all the files in the temp directory
echo Finally removing the temp_directory
@REM Delete all the files in the local settings temp folder
echo Removing local_settings__temp files
@REM Timeout is used to make the script wait for 1 seconds
timeout /t 1 
@REM Delete all the files in the local settings temp folder
del /f /s /q "%userprofile%\local settings\temp\*.*"

@REM ================================================================
@REM AUTHOR: KARTHIK LAL & :: EMAIL: karthiklal@duck.com
@REM CREATED DATE: 10-06-2022
@REM WINDOWS CLEANER SCRIPT - STABLE VERSION 2.3.1
@REM TOOLS ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY KIND AND THE AUTHOR IS NOT RESPONSIBLE FOR ANY DAMAGE CAUSED BY THE USE OF THESE TOOLS
@REM USE AT YOUR OWN RISK
@REM FORCED TO RUN ONLY WITH ADMINISTRATOR PRIVILEGES.
@REM LICESNSE: GNU GENERAL PUBLIC LICENSE V3.0
@REM OPENSOURCE SOFTWARE LICENSE AGREEMENT FOR WINDOWS DISTRIBUTION SYSTEM (https://www.gnu.org/licenses/gpl-3.0.en.html)
@REM Copying and distribution of this file, with or without modification, are permitted in any medium without royalty provided the copyright notice and this notice are preserved.
@REM Copyright (c) 2022-2023 KARTHIK LAL
@REM ================================================================