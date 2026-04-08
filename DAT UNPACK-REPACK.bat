@Echo OFF
CHCP 65001 1>NUL
title TLPatBP DAT UNPACK-REPACK
color 0a

:Menu
cls
echo ******************************************************
echo *           TLPatBP DAT UNPACK-REPACK TOOL           *
echo ******************************************************
echo.
echo ******************************************************
echo *                                                    *
echo * 1. Desempaquetar DATA.DAT y extraer textos         *
echo *                                                    *
echo * 2. Inyectar textos y reempaquetar DATA.DAT         *
echo *                                                    *
echo * 3. Créditos                                        *
echo *                                                    *
echo * 4. Salir del programa                              *
echo *                                                    *
echo ******************************************************
echo.
CHOICE /N /C:1234 /M "Escoge una opción (1-4): "%1
IF ERRORLEVEL ==4 Exit
IF ERRORLEVEL ==3 GOTO CREDITS
IF ERRORLEVEL ==2 GOTO REPACK
IF ERRORLEVEL ==1 GOTO UNPACK

:UNPACK
title Desempaquetando DATA.DAT...
cls
echo 1. Extrayendo DATA.DAT con QuickBMS...
if not exist DATA mkdir DATA
BIN\quickbms.exe -o -Y "BIN\fafullfs.bms" "data.dat" "DATA"

echo.
echo 2. Preparando directorios temporales y de localización...
if not exist BIN\dat mkdir BIN\dat
if not exist BIN\txt mkdir BIN\txt
if not exist L10N mkdir L10N

echo.
echo 3. Limpiando archivos temporales...
del /q "BIN\dat\*.*" >nul 2>&1
del /q "BIN\txt\*.*" >nul 2>&1

echo.
echo 4. Convirtiendo archivos de la base de datos a .txt...
copy "DATA\database\*.dat" "BIN\dat\" >nul
cd BIN
(echo 1) > temp.txt
LPBP_dat.exe < temp.txt
del temp.txt
cd ..

echo.
echo 5. Moviendo los .txt a la carpeta L10N...
move /y "BIN\txt\*.txt" "L10N\" >nul
del /q "BIN\dat\*.*" >nul 2>&1

title Desempaquetado completado
echo.
echo =========================================================================
echo PROCESO COMPLETADO.
echo Todos los textos han sido extraídos a la carpeta "L10N".
echo Las carpetas temporales han sido vaciadas.
echo =========================================================================
pause
goto :Menu

:REPACK
title Inyectando traducción y reempaquetando...
cls
echo ¡ADVERTENCIA! Este proceso inyectará los textos de L10N en el juego base.
echo Se modificará el archivo original "data.dat".
pause

echo.
echo 1. Preparando entorno de inyección...
if not exist BIN\dat mkdir BIN\dat
if not exist BIN\txt mkdir BIN\txt
if not exist BIN\new_dat mkdir BIN\new_dat

echo.
echo 2. Limpiando temporales anteriores...
del /q "BIN\dat\*.*" >nul 2>&1
del /q "BIN\txt\*.*" >nul 2>&1
del /q "BIN\new_dat\*.*" >nul 2>&1

echo.
echo 3. Preparando la inyección de textos...
copy "DATA\database\*.dat" "BIN\dat\" >nul
copy "L10N\*.txt" "BIN\txt\" >nul

echo.
echo 4. Generando nuevos archivos .dat traducidos...
cd BIN
(echo 2) > temp.txt
LPBP_dat.exe < temp.txt
del temp.txt
cd ..

echo.
echo 5. Moviendo archivos al directorio del juego y limpiando temporales...
move /y "BIN\new_dat\*.dat" "DATA\database\" >nul
del /q "BIN\dat\*.*" >nul 2>&1
del /q "BIN\txt\*.*" >nul 2>&1

echo.
echo 6. Reempaquetando DATA.DAT con QuickBMS...
BIN\quickbms.exe -o -Y -r -w "BIN\fafullfs.bms" "data.dat" "DATA"

Title Reempaquetado completado
echo.
echo =========================================================================
echo REEMPAQUETADO COMPLETADO.
echo Carpetas temporales vaciadas.
echo Inicia el juego para probar la traducción.
echo =========================================================================
pause
goto :Menu

:CREDITS
cls
title Créditos
echo ******************************************************
echo *  - Proyecto de traducción por Zeedif               *
echo *                                                    *
echo *  - Herramienta LPBP_dat por akintos                *
echo *    (zenhax.com/viewtopic.php@t=8497.html)          *
echo *                                                    *
echo *  - Quickbms por Luigi Auriemma                     *
echo *                                                    *
echo *  - Script FAFULLFS por akderebur                   *
echo *    (zenhax.com/viewtopic.php@t=7756.html)          *
echo *                                                    *
echo *  - Basado en EASY D4 DAT UNPACK-REPACK             *
echo ******************************************************
pause
goto :Menu