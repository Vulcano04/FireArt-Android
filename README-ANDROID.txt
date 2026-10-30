FireArt Android 0.5 — Fase 2 del motor de pinceles
==================================================

CONTENIDO
---------
- Aplicación Android WebView con la interfaz táctil existente.
- Catálogo de 27 presets de FireArt PC 2.66 cargado desde el JSON de recursos.
- Motor de sellos interpolados con control de espaciado, presión e inclinación.
- Dinámicas adicionales: puntas elípticas/planas, jitter angular y posicional,
  dispersión, grano, pigmento texturizado y mezcla húmeda aproximada por muestreo
  del color que ya existe bajo cada sello.
- Efectos de capa no destructivos en la previsualización: desenfoque, grises,
  inversión, contorno, sepia, sombra, brillo, contraste, saturación, matiz,
  pixelado, enfoque y aproximaciones visuales de monocromo, color de capa,
  trama, extracción de línea y borde.
- Importación/exportación de pinceles .fireartbrush.
- Versión web PWA disponible en ../FireArt-Web/index.html.

IMPORTANTE SOBRE PARIDAD
------------------------
La mezcla húmeda implementada es una aproximación por muestreo local de píxeles,
no un simulador físico de fluidos. Los filtros de trama, extracción de línea y
color de capa se representan mediante filtros de previsualización Canvas/CSS;
no son aún réplicas pixel-perfect de los filtros Python/Pillow de PC. La
presión/inclinación dependen de que Android, el navegador WebView y el stylus
transmitan esos eventos. Hay que validar rendimiento y latencia en la GAOMON.

CREAR APK EN WINDOWS CON UN CLIC
--------------------------------
1. Instala Android Studio y abre una vez el proyecto para que descargue el SDK.
2. Asegúrate de tener Android SDK Platform 35, Build Tools 35.0.0 y Java 17.
3. Haz doble clic en CREAR_APK_UN_CLIC.bat.
4. El APK debug se copia a la carpeta APK/FireArt-Android-debug.apk.

El BAT descarga Gradle 8.9 automáticamente si no está instalado. No instala
Android Studio ni el SDK completo; esas herramientas oficiales deben estar
instaladas y configuradas previamente.

ALTERNATIVA CLOUD
-----------------
Sube el contenido de este proyecto a un repositorio GitHub y ejecuta el workflow
"Build FireArt Android APK" desde Actions > Run workflow. El APK se publica como
artifact descargable.

PRUEBAS
-------
No se afirma que exista un APK compilado en este paquete. La compilación final
requiere Android SDK/Java y debe probarse en dispositivo real.


COMPILAR SIN SDK LOCAL
----------------------
Consulta COMPILAR_APK_EN_GITHUB_SIN_SDK.txt. El workflow de .github/workflows/build-apk.yml compila el APK en GitHub Actions.
