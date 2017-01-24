rem @echo off

set BIN=bin\pyhiew
set REL=release\pyhiew

copy %BIN%\init.py %REL%
copy %BIN%\hiew.py %REL%

