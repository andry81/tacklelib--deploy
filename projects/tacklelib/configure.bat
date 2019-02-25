@echo off

echo.^>%~dpnx0

setlocal

if not defined NEST_LVL set NEST_LVL=0

set /A NEST_LVL+=1

(
  echo.@echo off
  echo.
  echo.set PROJECT_NAME=tacklelib
  echo.set "WCROOT_OFFSET=%CONFIGURE_ROOT%/../../_%%PROJECT_NAME%%"
  echo.
  echo.set "TACKLELIB_DEPLOY.SVN.REPOROOT=https://%%SVN.HUB_ROOT%%/tacklelib/deploy"
  echo.set "TACKLELIB.SVN.REPOROOT=https://%%SVN.HUB_ROOT%%/tacklelib/tacklelib"
  echo.set "TACKLELIB_CMAKE.SVN.REPOROOT=https://%%SVN.HUB_ROOT%%/tacklelib/cmake"
  echo.set "TACKLELIB_SCRIPTS.SVN.REPOROOT=https://%%SVN.HUB_ROOT%%/tacklelib/scripts"
  echo.set "TACKLELIB_EXAMPLES.SVN.REPOROOT=https://%%SVN.HUB_ROOT%%/tacklelib/examples"
  echo.
  echo.set "TACKLELIB_DEPLOY.GIT.ORIGIN=https://%%GIT.USER%%@%%GIT.HUB_ROOT%%/%%GIT.REPO_OWNER%%/tacklelib--deploy.git"
  echo.set "TACKLELIB.GIT.ORIGIN=https://%%GIT.USER%%@%%GIT.HUB_ROOT%%/%%GIT.REPO_OWNER%%/tacklelib.git"
  echo.set "TACKLELIB_CMAKE.GIT.ORIGIN=https://%%GIT.USER%%@%%GIT.HUB_ROOT%%/%%GIT.REPO_OWNER%%/tacklelib--cmake.git"
  echo.set "TACKLELIB_SCRIPTS.GIT.ORIGIN=https://%%GIT.USER%%@%%GIT.HUB_ROOT%%/%%GIT.REPO_OWNER%%/tacklelib--scripts.git"
  echo.set "TACKLELIB_EXAMPLES.GIT.ORIGIN=https://%%GIT.USER%%@%%GIT.HUB_ROOT%%/%%GIT.REPO_OWNER%%/tacklelib--examples.git"
  echo.
  echo.set "TACKLELIB_DEPLOY.GIT2.ORIGIN=https://%%GIT2.USER%%@%%GIT2.HUB_ROOT%%/%%GIT2.REPO_OWNER%%/tacklelib-deploy.git"
  echo.set "TACKLELIB.GIT2.ORIGIN=https://%%GIT2.USER%%@%%GIT2.HUB_ROOT%%/%%GIT2.REPO_OWNER%%/tacklelib.git"
  echo.set "TACKLELIB_CMAKE.GIT2.ORIGIN=https://%%GIT2.USER%%@%%GIT2.HUB_ROOT%%/%%GIT2.REPO_OWNER%%/tacklelib-cmake.git"
  echo.set "TACKLELIB_SCRIPTS.GIT2.ORIGIN=https://%%GIT2.USER%%@%%GIT2.HUB_ROOT%%/%%GIT2.REPO_OWNER%%/tacklelib-scripts.git"
  echo.set "TACKLELIB_EXAMPLES.GIT2.ORIGIN=https://%%GIT2.USER%%@%%GIT2.HUB_ROOT%%/%%GIT2.REPO_OWNER%%/tacklelib-examples.git"
  echo.
  echo.set "TACKLELIB.GIT3.ORIGIN=https://%%GIT3.USER%%@%%GIT3.HUB_ROOT%%/%%GIT3.REPO_OWNER%%/tacklelib.git"
  echo.set "TACKLELIB_CMAKE.GIT3.ORIGIN=https://%%GIT3.USER%%@%%GIT3.HUB_ROOT%%/%%GIT3.REPO_OWNER%%/tacklelib--cmake.git"
  echo.set "TACKLELIB_SCRIPTS.GIT3.ORIGIN=https://%%GIT3.USER%%@%%GIT3.HUB_ROOT%%/%%GIT3.REPO_OWNER%%/tacklelib--scripts.git"
  echo.set "TACKLELIB_EXAMPLES.GIT3.ORIGIN=https://%%GIT3.USER%%@%%GIT3.HUB_ROOT%%/%%GIT3.REPO_OWNER%%/tacklelib--examples.git"
  echo.
) > "%~dp0configure.user.bat"

for /F "usebackq eol=	 tokens=* delims=" %%i in (`dir /A:D /B "%~dp0*.*"`) do (
  set "DIR=%%i"
  call :PROCESS_DIR
)

set /A NEST_LVL-=1

if %NEST_LVL% LEQ 0 pause

exit /b 0

:PROCESS_DIR
rem ignore directories beginning by `.`
if "%DIR:~0,1%" == "." exit /b 0

if exist "%~dp0%DIR%\configure.bat" call :CMD "%%~dp0%%DIR%%\configure.bat"

exit /b

:CMD
echo.^>%*
(%*)
