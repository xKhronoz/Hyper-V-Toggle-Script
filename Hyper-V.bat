@echo off

TITLE Select Steam account

taskkill.exe /F /IM steam.exe

cls
echo(
echo(
echo(
echo                                         Select Option
echo                            =======================================
echo(
echo 1) "Enable Hyper-V"
echo 2) "Disable Hyper-V"
echo(

CHOICE /M Select /C 12

If Errorlevel 2 Goto 2
If Errorlevel 1 Goto 1

:1
echo "Enabling Hyper-V"
pause
echo "Setting hypervisorlaunchtype auto"
bcdedit /set hypervisorlaunchtype auto
Goto end
:2
echo "Disabling Hyper-V"
pause
echo "Setting hypervisorlaunchtype off"
bcdedit /set hypervisorlaunchtype off
echo "Setting Registry keys"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d 0 /f
Goto end

:end

echo "A Restart is needed..."
pause
shutdown /r

exit