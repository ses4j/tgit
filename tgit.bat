@echo off
@setlocal

@REM Default the path argument to ., otherwise the second argument is the path.
set TGITPATH=.
if "%2" == "" goto execute

set TGITPATH=%2

:execute
@start tortoiseproc /command:"%1" /path:"%TGITPATH%" %2 %3
