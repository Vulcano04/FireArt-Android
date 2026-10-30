# FireArt Android 0.5 — Fase 2

## Trabajo de esta fase
- Se toma el catálogo JSON incluido desde FireArt PC 2.66 como fuente de verdad para los 27 presets, evitando mantener una segunda lista desincronizada.
- Se amplía el estampado del motor móvil: mezcla húmeda local aproximada, punta elíptica, inclinación, jitter angular, cerdas, dispersión, grano y pigmento.
- Se amplía el panel de efectos de capa con opciones inspiradas en las operaciones de PC.
- Se prepara una web app instalable (PWA) y compilación APK de un clic en Windows.

## Limitaciones honestas
La mezcla húmeda no es un solver físico; la simulación es por mezcla de color del píxel subyacente. Algunos efectos nuevos son filtros visuales aproximados en Canvas/CSS y no equivalen todavía a los algoritmos Pillow/Numpy de PC. Se necesita validación en GAOMON y pruebas de memoria/rendimiento en Android real.

## APK
El script `CREAR_APK_UN_CLIC.bat` usa Java 17, Android SDK 35 y Gradle 8.9. Gradle se descarga si falta. Android Studio/SDK debe estar instalado previamente. El artefacto final se copia en `APK/FireArt-Android-debug.apk`.
