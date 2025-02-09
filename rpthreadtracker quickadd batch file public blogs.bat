@echo off
setlocal enabledelayedexpansion

:loop
REM Prompt for URL
set /p url="Enter the Tumblr URL (or type 'exit' to quit): "

REM Keep looping until the user types 'exit'
if /i "%url%"=="exit" goto end

REM Params are grabbed from the URL
set tumblrBlogShortname=
set tumblrPostId=

REM Extract tumblrBlogShortname (between // and .tumblr.com)
for /f "tokens=2 delims=/" %%a in ("%url%") do (
    for /f "tokens=1 delims=." %%b in ("%%a") do set "tumblrBlogShortname=%%b"
)

REM Extract tumblrPostId (between post/ and last /)
for /f "tokens=4 delims=/" %%a in ("%url%") do set "tumblrPostId=%%a"

REM Output the tumblrPostId (for debugging)
echo Tumblr Post ID: !tumblrPostId!

REM Construct the final URL
set "finalUrl=http://www.rpthreadtracker.com/add-thread?tumblrBlogShortname=!tumblrBlogShortname!&tumblrPostId=!tumblrPostId!&addFromExtension=true"

REM Output the final URL
echo !finalUrl!

REM Open the final URL in the default browser
start "" "!finalUrl!"

goto loop

:end
endlocal