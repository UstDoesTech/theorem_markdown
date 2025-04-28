:: filepath: d:\repos\Theorems\theorem_markdown\install_windows.bat
@echo off
setlocal enabledelayedexpansion

:: Enable error handling
set EXIT_CODE=0
call :check_error

:: Install required LaTeX packages
tlmgr install truncate || set EXIT_CODE=1
tlmgr install tocloft || set EXIT_CODE=1
tlmgr install wallpaper || set EXIT_CODE=1
tlmgr install morefloats || set EXIT_CODE=1
tlmgr install sectsty || set EXIT_CODE=1
tlmgr install siunitx || set EXIT_CODE=1
tlmgr install threeparttable || set EXIT_CODE=1

:: Update specific LaTeX components
tlmgr update l3packages || set EXIT_CODE=1
tlmgr update l3kernel || set EXIT_CODE=1
tlmgr update l3experimental || set EXIT_CODE=1
tlmgr update l3backend || set EXIT_CODE=1

:: Optional: Update all packages (uncomment if needed)
:: tlmgr update --all || set EXIT_CODE=1

:: Exit with the appropriate code
exit /b %EXIT_CODE%

:check_error
if %EXIT_CODE% neq 0 (
    echo An error occurred during the installation or update process.
    exit /b %EXIT_CODE%
)