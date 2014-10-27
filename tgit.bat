@echo off
@setlocal

@REM Default the path argument to ., otherwise the second argument is the path.
set TGITPATH=.
set BASEREV=
set MAINCOMMAND=%1
set FIRSTARG=%2
@REM If no arguments, execute with default path.
if "%FIRSTARG%" == "" goto execute
@REM If arguments start with /, it's not a path.
call :StartsWith "%FIRSTARG%" "/" &&goto execute
@REM If argument starts with .., it's a relative branch,
call :StartsWith "%FIRSTARG%" ".." &&goto parsebranch

:setpath
set TGITPATH=%2
shift /2
goto execute

:parsebranch
if "%MAINCOMMAND%"=="log" set BASEREV=/startrev:HEAD /endrev:%FIRSTARG:~2%
if "%MAINCOMMAND%"=="diff" set MAINCOMMAND=showcompare
if "%MAINCOMMAND%"=="showcompare" set BASEREV=/revision1:HEAD /revision2:%FIRSTARG:~2%
shift /2

goto execute

:execute
@REM You may need to adjust the .exe path below, either with an absolute path
@REM or by changing it to TortoiseProc.exe, used in older versions of TortoiseGit.
echo Executing: TortoiseGitProc.exe /command:"%MAINCOMMAND%" /path:"%TGITPATH%" %BASEREV% %2 %3 %4
@start TortoiseGitProc.exe /command:"%MAINCOMMAND%" /path:"%TGITPATH%" %BASEREV% %2 %3 %4

goto end

:StartsWith text string -- Tests if a text starts with a given string
::                      -- [IN] text   - text to be searched
::                      -- [IN] string - string to be tested for
:$created 20080320 :$changed 20080320 :$categories StringOperation,Condition
:$source http://www.dostips.com
SETLOCAL
set "txt=%~1"
set "str=%~2"
if defined str call set "s=%str%%%txt:*%str%=%%"
if /i "%txt%" NEQ "%s%" set /a $err = 1
EXIT /b %$err%

:end