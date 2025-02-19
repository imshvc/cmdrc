@echo off

set script_name=%1

rem fail: no editor set
if [%EDITOR%] equ [] (
  echo.fail: no EDITOR variable set
  exit /b 1
)

rem fail: no script name
if [%script_name%] equ [] (
  echo.usage: edit-script ^<script name^>
  exit /b 2
)

set script_path=%HOME%\.cmd\scripts\%script_name%

rem multiple checks to not
rem require the file extension
if exist "%script_path%" (
  goto block_editor
)

if exist "%script_path%.bat" (
  set script_path=%script_path%.bat
  goto block_editor
)

if exist "%script_path%.cmd" (
  set script_path=%script_path%.cmd
  goto block_editor
)

rem fail: no script file
echo.fail: no script file under that name: %script_name%
exit /b 3

:block_editor
call "%EDITOR%" "%script_path%"
