@echo off

TITLE Toggle Hyper-V

cls
echo(
echo(
echo(
echo              Select Option
echo =======================================
echo(
echo 1) "Enable Hyper-V"
echo 2) "Disable Hyper-V"
echo(

CHOICE /M Select /C 12

If Errorlevel 2 Goto 2
If Errorlevel 1 Goto 1

:1
echo "Enabling Hyper-V..."
pause
echo "Setting hypervisorlaunchtype auto"
bcdedit /set hypervisorlaunchtype auto
echo "Enabling Hyper-V"
DISM /Online /Enable-Feature /All /FeatureName:Microsoft-Hyper-V
Goto end
:2
echo "Disabling Hyper-V..."
pause
echo "Setting hypervisorlaunchtype off"
bcdedit /set hypervisorlaunchtype off
echo "Setting Registry keys"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d 0 /f
echo "Disabling Hyper-V"
DISM /Online /Disable-Feature /All /FeatureName:Microsoft-Hyper-V
Goto end

:end

echo "*** A Restart is needed... Please save your work before continuing... ***"
echo "(Press 'Ctrl' + 'C' or close the script if you wish to restart later)"
pause
shutdown /r

exit
