# FireArt Android 0.4 — integración inicial PC

## Archivos principales
- `app/src/main/assets/index.html`: motor Canvas móvil, catálogo PC incrustado, importación/exportación de pinceles y motor de trazo.
- `app/src/main/assets/fireart_pc/brush_presets.json`: copia legible de los 27 presets `PRESETS['dibujo']` de FireArt PC 2.66.
- `app/src/main/assets/fireart_pc/catalog/`: paquetes de muestra `.fireasset` originales del PC.
- `app/build.gradle`: versión Android 0.4.

## Validación
- JavaScript inline: `node --check` correcto.
- ZIP: integridad verificada después de empaquetar.
- APK: no compilado en este entorno; requiere Android SDK/Gradle.
