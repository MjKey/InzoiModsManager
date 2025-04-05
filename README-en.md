
# Inzoi Mods Manager

A mod manager for the game Inzoi, developed with Flutter for the Windows platform.

## Features

- Mod management for Inzoi
- Support for .pak, .ucas, and .utoc file formats
- Automatic detection of related mod files
- Mod load order customization
- Bilingual interface (Russian and English)
- Light and dark themes
- Mod renaming within the interface
- Settings are saved between sessions
- Drag-and-drop mod management

## Installing Mods

Mods are installed at the following path: `{game}\BlueClient\Content\Paks\~mods`

## Usage

1. On the first launch, select the game folder
2. Use the "+" button to add mods
3. Drag mods between columns or use the "Enable"/"Disable" buttons
4. Use the "Rename" and "Delete" buttons to manage mods
5. Use the "Load Order" button to adjust the mod load order

## Building the Project

```bash
# Get dependencies
flutter pub get

# Run in debug mode
flutter run -d windows

# Build the release version
flutter build windows
```

## Requirements

- Flutter 3.0.0 or higher
- Windows 10 or higher
