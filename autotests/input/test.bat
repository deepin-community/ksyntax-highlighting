set "Def1="
set "VAR=bla bla %xx% bla !xx! bla"
set "LSW=%Nibble3%%Nibble2%%Nibble1%%Nibble0%"
set "Array[One]=Entrée 1"
set "Array[1]=Entrée 1"
set "Result!Counter!=%%A"
set "Result=%%A"
set "SInt32=%~2"
set "SInt32=-2147483648"
set "ScriptName=%~nx0"
set "VAR=%VAR:chaîne=voiture%"
set "VAR=%VAR:~3,6%"
set "VAR=%VAR:~31,63%"
set "Var=%Var% %%A"
set "%~1=%value%"
set VAR=bla bla %xx% !xx! bla
set VAR="bla bla %xx% !xx! bla"
set VAR_Saisie
set line=!line:~0,48!

set /p VAR_Saisie_Un=    ma saisie un:
set /p "Var2=Entrez une chaîne:    " 0>nul

set /a "Addition+=!foobar!"
set /a "Attrib0+=1"
set /a "Attrib1=1","Attrib2=2","Attrib3=3","Attrib4=4","Attrib5=5"
set /a "Attrib2*=2"
set /a "Attrib3-=2"
set /a "Attrib4/=2"
set /a "Attrib5%%=2"
set /a "Cinq=10 / 2"
set /a "Hexa=0x1 + 0x3"
set /a "Huit=8+Dix","Neuf=10-Un"
set /a "Mod=5 % 2"
set /a "Mod=5 %% 2"
set /a "Nibble%%A=15 - Nibble%%A"
set /a "Nibble%%A=Nibble7 %% 16", "Nibble7/=16"
set /a "Nibble0= SInt32 %% 16","HighOrder0= SInt32 / 16"
set /a "SInt32"
set /a "SInt32=~SInt32"
set /a "Sept=(( 2 + 1 ) * 2 ) + 1"
set /a "Val1AttribSwitchR=Val1","Val1AttribSwitchR>>=15"
set /a "Val1SwitchL01=Val1<<1","Val1SwitchL15=Val1<<15","Val1SwitchL31=Val1<<31"
set /a "Val3AttribXorVal4=Val3","Val3AttribXorVal4^=Val4"
set /a "Val3LogicalAndVal4=Val3 & Val4"
set /a "Val3LogicalOrVal4=Val3 | Val4"
set /a "Val3LogicalXorVal4=Val3 ^ Val4"
set /a "Var=09" 2>nul
set /a VAR_Calcul_Un=1+10
set /a DOW=(ANSI_DATE+1)%%7+1

rem bla bla ^& bla bla & bla bla
::bla bla ^& bla bla & bla bla

echo %VAR%
@echo off
@echo on
cls
@echo off & cls
echo. & echo. & echo 1 & echo 2
pause & exit /b 0
echo foo ^& ^| ^^ ^< ^> ^( ^)
echo %%
echo %PATH%
echo %HomeDrive%\Users\%UserName%
echo %VAR:~0,2% %VAR:~-6% %VAR:~0,-7%
echo VAR1: %VAR1%
echo %Val1% ^<^< 1: %Val1SwitchL01%
echo %Val3% ^|= %Val4%: %Val3AttribOrVal4%
echo %X:une=ma%
echo %~dpnx$ComSpec:1 %~nx0.
echo [ %~1 ]
echo %ScriptName% [/p^|/P] /hex ^<number^>
echo %ScriptName% {/?^|-?^|/h^|-h^|/help^|-help}
mkdir "%cd%\foo\beer"
type txt|findstr ^^bar
call :WriteFile >>"%cd%\foo\bar\bar.bat"
runas /User:%UserName% "cmd /c \"notepad \"%cd%\\%~nx0\""
timeout /t 10 /nobreak
exit /b
test.bat arg

call :WriteTestBat >>test.bat
echo abc2>file
echo abc 2>file
more<COMx
2>nul set "var=foo" && 2>nul set "var2=bar"
2>nul set /a "nb=09" && 2>nul set /a "nb2=07"
2>nul set "var=foo" || echo Erreur de la commande : set "var=foo"
2>nul set /a "nb=09" || echo Erreur de la commande : set /a "nb=09"
0>nul >&3 set /p "=%%a "
2>nul set "var=foo" || echo Erreur de la commande : set "var=foo"
1>"%cd%\test.txt" echo line 1
1>>"%cd%\test.txt" echo ;commentary
<&3>logInput.txt type test.txt
(
  echo foo
  echo bar
)>>txt

(
    2>nul set /a "var=09"
) || (
    echo [Erreur] 1           set /a "var=09"
) && (
    echo [Ok]     1           set /a "var=09"
)

3>>buffer3 (
    1<&3 echo Foo
    1>&3 echo Bar
    0>nul >&3 set /p "=Foo"
    >&3 echo Bar
)

if %value% equ !%1! (
   endlocal & (
      echo %1
      exit /b 0
   )
)

if exist "%cd%" echo %cd% exists
if defined Def1 (
    echo Def1 is defined
)
if not defined Def2 (
    echo Def2 is not defined
) else (
    echo Def3
)

if not errorlevel 1 echo no error
if errorlevel 1 echo code = %ErrorLevel%.

if "%s1%" GTR 1
    echo "gtr".
else if "%s1%" EQU "%s2%" (
    echo "eq".
)
if /i "%s1%" LSS "%s2%" (
    echo "lss".
) else if /i "%s1%" NEQ "%s2%" (
    echo "neq".
)

if exist text.txt 9>>buffer9 (
    >&9 echo Le fichier text.txt a été trouvé.
)

if %~2 GEQ 1 echo ok
if "%x%"=="%y%" echo ==
if not "%x%"=="%y%" echo !=
if /i "%x%"=="%y%" echo ==
if "%~1"=="" goto Init
if %~1 EQU /P set /a "UpperPrefix=1"
if "!FixLine:~0,1!"=="[" echo ok
if %CasseSensitive% "%%~b"=="%IniEntrie%" echo %%a
if "!foo:~%%a,1!"=="&" ( call :Injection "!foo:~%%a,1!" "%foo%" )

goto Label
:Label
call :Label
goto :eof

for %%A in (texte) do echo %%A
for %%B in ("%cd%") do if exist %%B echo %%B
for %%A in (a,z) do (
    set "Var=%Var% %%A"
)
for %%A in (One,Two,Three) do echo !Array[%%A]!
if /i "%NegNum%"=="true" for /l %%A in (0 1 7) do set /a "Nibble%%A=15 - Nibble%%A"
for /d %%A in ("%cd%\foo\*") do echo %%A
for /r "%cd%\foo" %%B in ("*.bat") do echo %%~B
for /l %%A in (1 1 20) do echo Le paramètre A a pour valeur %%A.
for /l %%B in (1 1 !Counter!) do if not "!Var%%B!"=="" echo !Var%%B!
for /l %%A in (0 1 4096) do (
    if "!str:~%%A,1!"=="" exit /b %%A
)
for /f "eol=; delims=" %%A in ('type test.txt') do echo %%A
for /f "tokens=1-5*" %%A in ("1 2 3 4 5 6 7 8 9") do (
    echo %%A
    echo %%B
)
for /f "usebackq delims=" %%A in (`type "%cd%\%~nx0"`) do (
    echo %%A
)
for /f "usebackq delims=" %%A in (`type text.txt^|find /n /v ""`) do (
    for /f "tokens=1-2 delims=[]" %%a in ("%%A") do echo Ligne %%a: %%b
)
for /f "delims=" %%a in ('type text.txt') do (((
            echo %%a | findstr \^<foo 1>&3
            echo %%a | findstr \^<bar 1>&4
            echo %%a | findstr bar\^> 1>&5
        ) 5>>buffer5
    ) 4>>buffer4
) 3>>buffer3
