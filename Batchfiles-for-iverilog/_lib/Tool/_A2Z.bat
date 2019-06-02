@echo off
title IVerilog and GTKWave
mode con cols=60 lines=30
color 0f

:start
set "p=%~dp0"
for /f "delims=\" %%i in ("%p:~0,-1%") do (set PrjName=%%~ni)

dir *.v /b>file_list.txt

iverilog -o %PrjName% -c file_list.txt
if %errorlevel% == 0 (
    echo Compile successfully!
) else (
    echo -------------------------------
    echo           Fix that
    echo             and
    echo  Press Enter to compile again.
    echo -------------------------------
    set /p=
    cls
    goto start
)

if exist .\test.txt (
    del .\test.txt
)
vvp -n %PrjName% -lxt2
echo -------------------------------
echo  Press Enter to run GTKWave.
echo -------------------------------
pause

if exist *.lxt2 (del .\*.lxt2)
ren %~dp0"test.vcd" wave.lxt2

gtkwave wave.lxt2