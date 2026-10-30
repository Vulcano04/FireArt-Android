@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title FireArt Android - Crear APK
echo ============================================
echo       FIREART ANDROID 0.5 - APK
echo ============================================
echo.

set "JAVA_HOME=%JAVA_HOME%"
if not defined JAVA_HOME (
  if exist "%ProgramFiles%\Android\Android Studio\jbr\bin\java.exe" set "JAVA_HOME=%ProgramFiles%\Android\Android Studio\jbr"
  if exist "%ProgramFiles%\Android Studio\jbr\bin\java.exe" set "JAVA_HOME=%ProgramFiles%\Android Studio\jbr"
)
if defined JAVA_HOME set "PATH=%JAVA_HOME%\bin;%PATH%"
where java >nul 2>nul
if errorlevel 1 (
  echo ERROR: No encuentro Java 17.
  echo Instala Android Studio o JDK 17 y vuelve a ejecutar este archivo.
  pause
  exit /b 1
)
for /f "tokens=3" %%V in ('java -version 2^>^&1 ^| findstr /i "version"') do set "JVER=%%~V"
echo Java detectado: %JVER%

set "SDK=%ANDROID_SDK_ROOT%"
if not defined SDK set "SDK=%ANDROID_HOME%"
if not defined SDK if exist "%LOCALAPPDATA%\Android\Sdk" set "SDK=%LOCALAPPDATA%\Android\Sdk"
if not defined SDK if exist "%USERPROFILE%\AppData\Local\Android\Sdk" set "SDK=%USERPROFILE%\AppData\Local\Android\Sdk"
if not defined SDK (
  echo ERROR: No encuentro Android SDK.
  echo Instala Android Studio, inicia el asistente de configuracion y descarga Android SDK.
  pause
  exit /b 1
)
set "ANDROID_SDK_ROOT=%SDK%"
set "ANDROID_HOME=%SDK%"
set "SDKMANAGER=%SDK%\cmdline-tools\latest\bin\sdkmanager.bat"
if not exist "%SDKMANAGER%" (
  echo ERROR: Falta Android SDK Command-line Tools.
  echo En Android Studio abre SDK Manager ^> SDK Tools e instala Android SDK Command-line Tools.
  pause
  exit /b 1
)
echo SDK: %SDK%
echo Aceptando licencias e instalando componentes necesarios...
call "%SDKMANAGER%" --licenses
call "%SDKMANAGER%" "platforms;android-35" "build-tools;35.0.0"
if errorlevel 1 (
  echo ERROR: No se pudieron instalar los componentes Android SDK.
  pause
  exit /b 1
)

set "GRADLE_HOME=%LOCALAPPDATA%\FireArt\gradle-8.9"
if exist "%GRADLE_HOME%\bin\gradle.bat" goto HAVE_GRADLE
where gradle >nul 2>nul
if not errorlevel 1 (
  set "GRADLE_CMD=gradle"
  goto BUILD
)
echo Descargando Gradle 8.9 (solo la primera vez)...
if not exist "%LOCALAPPDATA%\FireArt" mkdir "%LOCALAPPDATA%\FireArt"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; $zip=Join-Path $env:TEMP 'gradle-8.9-bin.zip'; Invoke-WebRequest 'https://services.gradle.org/distributions/gradle-8.9-bin.zip' -OutFile $zip; Expand-Archive -Force $zip '%LOCALAPPDATA%\FireArt'; Remove-Item $zip"
if errorlevel 1 (
  echo ERROR: No se pudo descargar Gradle. Comprueba tu conexion a internet.
  pause
  exit /b 1
)
:HAVE_GRADLE
set "GRADLE_CMD=%GRADLE_HOME%\bin\gradle.bat"

:BUILD
echo.
echo Compilando FireArt Android...
call %GRADLE_CMD% --no-daemon --stacktrace :app:assembleDebug
if errorlevel 1 (
  echo.
  echo ERROR: La compilacion fallo. Revisa Java 17, SDK 35 y el mensaje anterior.
  pause
  exit /b 1
)
if not exist "APK" mkdir "APK"
copy /y "app\build\outputs\apk\debug\app-debug.apk" "APK\FireArt-Android-debug.apk" >nul
echo.
echo ============================================
echo APK CREADO: APK\FireArt-Android-debug.apk
echo ============================================
start "" "APK"
pause
