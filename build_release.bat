@echo off
echo Building signed release bundle for BitTime...
echo.

echo Step 1: Clean build
flutter clean

echo Step 2: Get dependencies  
flutter pub get

echo Step 3: Build signed App Bundle
flutter build appbundle --release

echo.
echo Build complete! 
echo Your signed app bundle is at: build\app\outputs\bundle\release\app-release.aab
echo.
echo File size:
dir build\app\outputs\bundle\release\app-release.aab

pause
