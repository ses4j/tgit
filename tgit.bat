@echo off
@setlocal

@REM Default the path argument to ., otherwise the second argument is the path.
set TGITPATH=.

if "%2" == "" goto execute
call :StartsWith "%2" "/" &&goto execute ||goto setpath

:setpath
set TGITPATH=%2
shift /2

:execute
@REM You may need to adjust the .exe path below, either with an absolute path
@REM or by changing it to TortoiseProc.exe, used in older versions of TortoiseGit.
@start TortoiseGitProc.exe /command:"%1" /path:"%TGITPATH%" %2 %3 %4

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