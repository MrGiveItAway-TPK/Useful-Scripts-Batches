@echo off
if not exist %LocalAppData%\Temp\ (
  mkdir %LocalAppData%\Temp\
)
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo Requesting Admin Rights
goto UACPrompt
) else ( goto Main )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%TEMP%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%TEMP%\getadmin.vbs"
"%TEMP%\getadmin.vbs"
exit /B

:Main
color 0a
title Windows Tool Box By Munes Bani Fawaz
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b
cls
echo.
echo Windows Tool Box:
echo.
echo 1.Clear Temps
echo.
echo 2.Reset Internet (Restart Required)
echo.
echo 3.Attempt to Fix Common Windows Problems or Bad Media / Installation Files
echo.
echo 4.Enable Hibernate Mode
echo.
echo 5.Disable Hibernate Mode
echo.
echo 6.Attempt to Fix Common Disk Problems and etc...
echo.
echo 7.Enable Windows Godmode
echo.
echo 0.Exit (At Anytime if you want to cancel a proccess press CTRL+C)
echo.
set /p choice="Choice: "
goto %choice%

:0
exit

:1
cls
echo Cleaning Temps...
del %temp%\*.tmp /f /s /q >nul 2>nul
del %windir%\prefetch\*.* /f /s /q >nul 2>nul
del %windir%\temp\*.* /f /s /q >nul 2>nul
rmdir /s /q %windir%\temp\ >nul 2>nul
del c:\*.tmp /f /s /q >nul 2>nul
del d:\*.tmp /f /s /q >nul 2>nul
del c:\temp\*.tmp /f /s /q >nul 2>nul
del d:\temp\*.tmp /f /s /q >nul 2>nul
del c:\windows\prefetch\*.* /f /s /q >nul 2>nul
del d:\windows\prefetch\*.* /f /s /q >nul 2>nul
del c:\windows\temp\*.* /f /s /q >nul 2>nul
del d:\windows\temp\*.* /f /s /q >nul 2>nul
del c:\win98\temp\*.* /f /s /q >nul 2>nul
del d:\win98\temp\*.* /f /s /q >nul 2>nul
del c:\winnt\temp\*.* /f /s /q >nul 2>nul
del d:\winnt\temp\*.* /f /s /q >nul 2>nul
del c:\winme\temp\*.* /f /s /q >nul 2>nul
del d:\winme\temp\*.* /f /s /q >nul 2>nul
rmdir /s /q c:\windows\temp\ >nul 2>nul
rmdir /s /q d:\windows\temp\ >nul 2>nul
del C:\"Documents and Settings"\%username%\Cookies\*.* /f /s /q >nul 2>nul
del D:\"Documents and Settings"\%username%\Cookies\*.* /f /s /q >nul 2>nul
del c:\"Documents and Settings"\%username%\Recent\*.* /f /s /q >nul 2>nul
del D:\"Documents and Settings"\%username%\Recent\*.* /f /s /q >nul 2>nul
del C:\"Documents and Settings"\%username%\"local Settings"\temp\*.* /f /s /q >nul 2>nul
del D:\"Documents and Settings"\%username%\"local Settings"\temp\*.* /f /s /q >nul 2>nul
rmdir /s /q c:\"Documents and Settings"\%username%\"local Settings"\temp\ >nul 2>nul
rmdir /s /q d:\"Documents and Settings"\%username%\"local Settings"\temp\ >nul 2>nul
del C:\"Documents and Settings"\%username%\"Local Settings"\"temporary internet files"\*.* /f /s /q >nul 2>nul
del d:\"Documents and Settings"\%username%\"local Settings"\"temporary internet files"\*.* /f /s /q >nul 2>nul
del c:\"Documents and Settings"\%username%\"application data"\microsoft\office\recent\*.* /f /s /q >nul 2>nul
del d:\"Documents and Settings"\%username%\"application data"\microsoft\office\recent\*.* /f /s /q >nul 2>nul
rmdir /s /q C:\"Documents and Settings"\%username%\"local Settings"\"temporary internet files"\ >nul 2>nul
rmdir /s /q D:\"Documents and Settings"\%username%\"local Settings"\"temporary internet files"\ >nul 2>nul
cls
echo Cleared Temps Successfully
echo.
pause
goto Main

:2
cls
ipconfig /flushdns >nul 2>nul
cls
echo Flushing DNS...
PING -n 5 127.0.0.1>nul
ipconfig /registerdns >nul 2>nul
cls
echo Registering DNS...
PING -n 5 127.0.0.1>nul
cls
echo Releasing DNS...
ipconfig /release >nul 2>nul
PING -n 5 127.0.0.1>nul
cls
echo Renewing DNS...
ipconfig /renew >nul 2>nul
PING -n 5 127.0.0.1>nul
cls
echo Resetting Winsocket...
netsh winsock reset >nul 2>nul
PING -n 5 127.0.0.1>nul
cls
echo Restarting...
shutdown /r /t 0 >nul 2>nul

:3
cls
echo Running DISM Tool...
DISM.exe /Online /Cleanup-image /Restorehealth
PING -n 5 127.0.0.1>nul
cls
echo Running SFC Tool...
sfc /scannow
PING -n 5 127.0.0.1>nul
cls
echo Possible Solutions Applied Successfully
echo.
pause
goto Main

:4
cls
echo Enabling Hibernate Mode...
powercfg.exe /hibernate on >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /V ShowHibernateOption /T REG_DWORD /F /D 1 >nul 2>nul
PING -n 5 127.0.0.1>nul
cls
echo Hibernate Mode Enabled Successfully
echo.
pause
goto Main

:5
cls
echo Disabling Hibernate Mode...
powercfg.exe /hibernate off >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /V ShowHibernateOption /T REG_DWORD /F /D 0 >nul 2>nul
PING -n 5 127.0.0.1>nul
cls
echo Hibernate Mode Disabled Successfully
echo.
pause
goto Main

:6
cls
echo Checking Disks...
for /F "skip=1" %%D in ('wmic LogicalDisk WHERE DriveType^=3 GET DeviceID') do (
    for /F %%C in ("%%D") do (
        CHKDSK %%D /F /R /X
    )
)
PING -n 5 127.0.0.1>nul
cls
echo Possible Solutions Applied Successfully
echo.
pause
goto Main

:7
cls
echo Enabling Godmode...
mkdir %userprofile%\desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C} >nul 2>nul
PING -n 5 127.0.0.1>nul
cls
echo Godmode Enabled Check Your Desktop For A Control Panel Alike Icon With No Name !
echo.
pause
goto Main
