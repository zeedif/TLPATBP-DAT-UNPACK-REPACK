@Echo OFF
CHCP 65001 1>NUL
title DAT UNPACK-REPACK
color 0a

:Menu
cls
echo ******************************************************
echo *               Bienvenido al programa               *
echo ******************************************************
echo.
echo ******************************************************
echo *                                                    *
echo * 1. Desempaquetar DATA.DAT                          *
echo *                                                    *
echo * 2. Reempaquetar DATA.DAT                           *
echo *                                                    *
echo * 3. Creditos                                        *
echo *                                                    *
echo * 4. Salir del programa                              *
echo *                                                    *
echo ******************************************************
echo.
CHOICE /N /C:1234 /M "Escoge una opcion (1-4)"%1
IF ERRORLEVEL ==4 Exit
IF ERRORLEVEL ==3 GOTO CREDITS
IF ERRORLEVEL ==2 GOTO REPACK
IF ERRORLEVEL ==1 GOTO UNPACK

:UNPACK
title Desempaquetando DATA.DAT...
cls
if not exist DATA mkdir DATA
BIN\quickbms.exe -Y "BIN\fafullfs.bms" "data.dat" "DATA"
title Desempaquetado completado
echo.
pause
goto :Menu

:REPACK
title Reempaquetando DATA.DAT...
cls
BIN\quickbms.exe -Y -r -w "BIN\fafullfs.bms" "data.dat" "DATA"
Title Reempaquetado completado
echo.
pause
goto :Menu

:CREDITS
cls
title Creditos
echo ******************************************************
echo *  - Proyecto de Traduccion por Zeedif               *
echo *                                                    *
echo *  - Quickbms por Luigi Auriemma                     *
echo *                                                    *
echo *  - Script FAFULLFS extraido de Zenhax (hilo 7756)  *
echo *                                                    *
echo *  - Basado en EASY D4 DAT UNPACK-REPACK             *
echo ******************************************************
pause
goto :Menu