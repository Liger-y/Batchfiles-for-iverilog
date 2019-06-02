@echo off
title IVerilog and GTKWave
mode con cols=45 lines=20
color 0f

set "year=%date:~0,4%"
set "month=%date:~5,2%"
set "day=%date:~8,2%"
set "hour_ten=%time:~0,1%"
set "hour_one=%time:~1,1%"
set "minute=%time:~3,2%"
set "second=%time:~6,2%"

echo.
echo *****************
echo 1-empty prj
echo 2-FSM-Template
echo *****************
echo.
set /p select="#Select:"

:start
set /p PrjName="New PrjName:"

if exist .\%PrjName% (
echo Prj aready exist!
goto start)

set /p CodeFunction="Describtion:"

echo %PrjName%

mkdir .\%PrjName%

echo %CodeFunction%
echo %year%/%month%/%day%_%hour_ten%%hour_one%:%minute%:%second%

echo Time:%year%/%month%/%day%_%hour_ten%%hour_one%:%minute%:%second%>.\%PrjName%\readme.txt
echo Describtion:%CodeFunction%>>.\%PrjName%\readme.txt

if %select% == 2 (
    copy .\_lib\Tool\* .\%PrjName%\
    copy .\_lib\Template\FSM\* .\%PrjName%\
) else (
    copy .\_lib\Tool\* .\%PrjName%\
    copy .\_lib\Template\empty\* .\%PrjName%\
)

ren %~dp0%PrjName%\"MainFileSample.v" %PrjName%".v"
ren %~dp0%PrjName%\"TestBenchSample.v" %PrjName%"_tb.v"