@echo off
title BitLocker Enable C: and D: Without TPM

:: Run as Administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo ==================================
echo BitLocker Enable (C: and D:)
echo ==================================
echo.

echo [1/4] Configuring Group Policy via Registry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\FVE" /v UseAdvancedStartup /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\FVE" /v EnableBDEWithNoTPM /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\FVE" /v UseTPM /t REG_DWORD /d 2 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\FVE" /v UseTPMPIN /t REG_DWORD /d 2 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\FVE" /v UseTPMKey /t REG_DWORD /d 2 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\FVE" /v UseTPMKeyPIN /t REG_DWORD /d 2 /f >nul

echo Updating Group Policy...
gpupdate /force >nul

:: ====================================
:: DRIVE C: SETUP
:: ====================================
echo.
echo [2/4] Setting up Drive C:...

:: Remove existing Password protector on C: to avoid Error 0x80310031
manage-bde -protectors -delete C: -type Password >nul 2>&1

echo Adding Startup Password Protector for C:...
manage-bde -protectors -add C: -Password

if %errorlevel% neq 0 (
    echo [ERROR] Failed to add Password Protector for C:
    pause
    exit /b
)

echo Adding Recovery Password Protector for C:...
manage-bde -protectors -add C: -RecoveryPassword >nul

echo Enabling BitLocker on C:...
:: -skiphardwaretest To enforce Encrypt now
manage-bde -on C: -skiphardwaretest

:: ====================================
:: DRIVE D: SETUP
:: ====================================
echo.
echo [3/4] Setting up Drive D:...
echo Adding Recovery Password Protector for D:...
manage-bde -protectors -add D: -RecoveryPassword >nul

echo Enabling BitLocker on D:...
manage-bde -on D:

echo Enabling Auto-Unlock for D:...
manage-bde -autounlock -enable D:

:: ====================================
:: SUMMARY & KEYS
:: ====================================
echo.
echo ==================================
echo [4/4] Recovery Keys (Save These!)
echo ==================================
echo.
echo --- C: Protectors ---
manage-bde -protectors -get C:
echo.
echo --- D: Protectors ---
manage-bde -protectors -get D:

echo.
echo ==================================
echo Encryption Status
echo ==================================
echo.
echo --- C: Status ---
manage-bde -status C:
echo.
echo --- D: Status ---
manage-bde -status D:

echo.
echo ===================================================
echo WARNING: System will RESTART in 10 seconds!
echo Please make sure you have saved your Recovery Keys.
echo ===================================================
echo.

:: Restart 10 second 
shutdown /r /t 10 /c "Restarting to enforce BitLocker Startup Password."

pause
