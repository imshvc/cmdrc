@echo off

rem authors:     Nurudin Imsirovic <imshvc>
rem file:        rc.cmd
rem description: Command Prompt Init File
rem created:     2025-02-10 07:37 AM
rem updated:     2025-02-10 08:52 AM
rem repo:        https://github.com/imshvc/cmdrc

rem developer variables
set IS_ADMIN=0

rem hide version output
cls

rem set administrator state
net.exe session 1>nul 2>&1
if %ERRORLEVEL% equ 0 (
  set IS_ADMIN=1
)

rem set custom prompt
if %IS_ADMIN% equ 1 (
  set PROMPT=[91m$P[0m$_#^ 
) else (
  set PROMPT=[92m$P[0m$_$$^ 
)

rem unset variables
set IS_ADMIN=

rem common aliases
doskey .=explorer $*
doskey ..=cd ..
doskey path=echo %%PATH%%
doskey clear=cls
doskey c=cls
doskey q=exit
doskey r=cd \

rem hack: close the terminal window with: Ctrl + D + Enter
doskey =exit

rem include scripts
set PATH=%~dp0scripts;%PATH%
