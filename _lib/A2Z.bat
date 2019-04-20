@echo off
set "p=%~dp0"
for /f "delims=\" %%i in ("%p:~0,-1%") do (set PrjName=%%~ni)

dir *.v /b>file_list.txt

@echo on
iverilog -o %PrjName% -c file_list.txt
@pause

@del .\test.txt
vvp -n %PrjName% -lxt2
@pause

@if exist *.lxt2 (del .\*.lxt2)
@ren %~dp0"test.vcd" test.lxt2

gtkwave test.lxt2