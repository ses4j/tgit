@echo off
@setlocal

@REM Default the path argument to ., otherwise the second argument is the path.
set TGITPATH=.
if "%2" == "" goto execute

set TGITPATH=%2

:execute
@REM You may need to adjust the .exe path below, either with an absolute path
@REM or by changing it to TortoiseProc.exe, used in older versions of TortoiseGit.
@start TortoiseGitProc.exe /command:"%1" /path:"%TGITPATH%" %2 %3
