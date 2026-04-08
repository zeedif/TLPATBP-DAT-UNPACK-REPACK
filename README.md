# THE LIAR PRINCESS AND THE BLIND PRINCE DAT UNPACK-REPACK

Entorno de trabajo para extraer y reempaquetar el archivo `data.dat` del videojuego *The Liar Princess and the Blind Prince* (PC/Steam), utilizando las herramientas QuickBMS y LPBP_dat.exe.

## Instrucciones de uso

1. Copia todo el contenido de este repositorio y pegalo en el directorio raíz del juego, en la misma ubicación donde se encuentra el archivo `data.dat` original.
2. Ejecuta el script `DAT UNPACK-REPACK.bat`.
3. Para extraer los archivos del juego y generar los documentos de texto, ingresa la opción **1** (Desempaquetar DATA.DAT y extraer textos). Los textos extraídos se almacenarán en la carpeta `L10N`.
4. Para aplicar la traducción al juego, ingresa la opción **2** (Inyectar textos y reempaquetar DATA.DAT). Este proceso leerá los documentos de texto de la carpeta `L10N` e inyectará las modificaciones directamente en el archivo `data.dat`.

Nota: Se recomienda realizar una copia de seguridad del archivo `data.dat` original antes de proceder con la opción de reempaquetado.

## Créditos
* **Traducción:** Zeedif
* **Herramienta LPBP_dat:** akintos de la comunidad de [Zenhax (hilo 8497)](https://zenhax.com/viewtopic.php@t=8497.html)
* **QuickBMS:** Luigi Auriemma
* **Script FAFULLFS:** akderebur de la comunidad de [Zenhax (hilo 7756)](https://zenhax.com/viewtopic.php@t=7756.html)
* **Arquitectura base:** Inspirada en EASY D4 DAT UNPACK-REPACK (Darkmet98 / Glowtranslations)