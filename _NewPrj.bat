@echo off
title IVerilog and GTKWave
:start
echo New PrjName:
set /p PrjName=

if exist .\%PrjName% (
echo Prj aready exist!
goto start)

echo %PrjName%

mkdir .\%PrjName%

copy .\_lib\* .\%PrjName%\

ren %~dp0%PrjName%\"MainFileSample.v" %PrjName%".v"
ren %~dp0%PrjName%\"TestBenchSample.v" %PrjName%"_tb.v"
::pause