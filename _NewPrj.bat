@echo off
title IVerilog and GTKWave
:start

set "year=%date:~0,4%"
set "month=%date:~5,2%"
set "day=%date:~8,2%"
set "hour_ten=%time:~0,1%"
set "hour_one=%time:~1,1%"
set "minute=%time:~3,2%"
set "second=%time:~6,2%"

echo New PrjName:
set /p PrjName=

if exist .\%PrjName% (
echo Prj aready exist!
goto start)

echo Describtion:
set /p CodeFunction=

echo %PrjName%

mkdir .\%PrjName%

copy .\_lib\* .\%PrjName%\

echo Describtion: %CodeFunction%>>.\%PrjName%\readme.txt
echo Time: %year%/%month%/%day%_%hour_ten%%hour_one%:%minute%:%second%>.\%PrjName%\readme.txt

ren %~dp0%PrjName%\"MainFileSample.v" %PrjName%".v"
ren %~dp0%PrjName%\"TestBenchSample.v" %PrjName%"_tb.v"
::pause