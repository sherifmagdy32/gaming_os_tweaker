:: Add context menu option to open with vscodium
REG ADD "HKEY_CLASSES_ROOT\*\shell\Open with VS Codium" /v @ /t REG_SZ /d "Edit with VS Codium" /f
REG ADD "HKEY_CLASSES_ROOT\*\shell\Open with VS Codium" /v Icon /t REG_SZ /d "C:\\Users\\PC\\AppData\\Local\\Programs\\VSCodium\\VSCodium.exe" /f
REG ADD "HKEY_CLASSES_ROOT\*\shell\Open with VS Codium\command" /v @ /t REG_SZ /d "\"C:\\Users\\PC\\AppData\\Local\\Programs\\VSCodium\\VSCodium.exe\" \"%1\"" /f