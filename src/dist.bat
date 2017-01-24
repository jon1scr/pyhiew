rem @echo off

rem 1. First synchronize this framework folder with the DISTSRC folder
rem 2. After all public files are ready (from step 1) run this script from private folder (this framework folder) to generate the package files

rem Setup
set DISTSRC=C:\opensource\pyhiew
set DIST=%DISTSRC%\rel\pyhiew
set PYPATH=c:\python27
set TOOLSPATH=c:\tools\bins

rem Delete previous dist files
del %DIST% /s /q > nul
rmdir %DIST%\doc
rmdir %DIST%\pyhiew\3rd
rmdir %DIST%\pyhiew
rmdir %DIST%\python25

call "C:\Program Files (x86)\Microsoft Visual Studio 9.0\VC\vcvarsall.bat" x86
title Building hiew

rem Start compiling
FOR %%a in (25 27) DO (
  echo.
  echo ------------------------
  echo Building for Python %%a
  echo ------------------------
  echo.
  if exist release\pyhiew%%a.hem del release\pyhiew%%a.hem
  cl /O2 /Ob1 /Ot /Oy /GL /I "c:\Python%%a\Include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "_CRT_SECURE_NO_WARNINGS" /D "DISTRIBUTION" /D "_WINDLL" /D "_MBCS" /GF /FD /EHsc /MT /Zp1 /Gy /Fo".\Release/" /Fd".\Release/" /FR"Distribution\\" /W3 /nologo /c /TP pyhiew.cpp util.cpp ..\sdk\HiewGate.c /I "..\sdk"

  if not errorlevel 0 goto bad_compile

  link /LTCG /OUT:".\Release\pyhiew%%a.hem" /INCREMENTAL:NO /NOLOGO /LIBPATH:"c:\Python%%a\Libs" /DLL /MANIFEST:NO /BASE:"0x31000000" /DYNAMICBASE:NO /NXCOMPAT /IMPLIB:".\Release/Pyhiew.lib" /MACHINE:X86 /ERRORREPORT:PROMPT kernel32.lib user32.lib release\pyhiew.obj release\util.obj release\hiewgate.obj

  if not errorlevel 0 goto bad_compile
)

goto dist

:dist
  rem Make minor folders
  mkdir %DIST%\python25
  move Release\pyhiew25.hem %DIST%\python25\pyhiew.hem

  rem Move major bin
  move Release\pyhiew27.hem %DIST%\pyhiew.hem

  rem Make documentation
  mkdir %DIST%\doc
  %PYPATH%\python pyhiewdoc.py
  move doc\*.* %DIST%\doc\

  rem Prepare PyHiew
  mkdir %DIST%\PyHiew
  mkdir %DIST%\PyHiew\3rd

  rem Copy script files
  FOR %%a in (
    ClipText.py
    Decompress.py
    hello.py
    hiew.py
    init.py
    scriptbrowser.py
    Strings.py
    PEiD.py
    test_pyshell.py
    IDA-Names-Server.py
    UserDB.TXT
    fsPlus.dll
    fsPlus.ini
    fsPlus.py
    3rd\IDA-Names-Client.py
  ) DO (
    rem Copy script
    COPY %DISTSRC%\bin\pyhiew\%%a %dist%\pyhiew\%%a
  )

  rem Compress release
  pushd .
  cd %DIST%
  zip -r %DIST%\rel.zip *
  popd
  goto end

:bad_compile
  echo Failed to compile!
  goto end

:end