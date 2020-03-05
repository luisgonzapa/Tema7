
  !include "MUI2.nsh"

  ;Name and file
  Name "AppHotel"
  OutFile "AppHotel.exe"
  Unicode True

  InstallDir "C:\AppHotel"

  RequestExecutionLevel user

  ;----------------------------------
  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  UninstPage uninstConfirm
  UninstPage instFiles

  ;---------------------------------
  ;Installer Sections
  Section "Instalacion AppHotel"
  SetOutPath "$INSTDIR"

  SetCompress off
  DetailPrint "Extrayendo..."
  SetDetailsPrint listonly

  File AppHotelDingo.7z
  SetCompress auto
  SetDetailsPrint both

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  ;Extrae app y borra archivo.
  Nsis7z::Extract "AppHotelDingo.7z"
  Delete "$OUTDIR\AppHotelDingo.7z"

  ;--------------------------------
  ;Uninstaller Section
  Section "Desinstalacion"
      ;Borra archivos
      Delete $INSTDIR\lib\*.*
      Delete $INSTDIR\web-files\*.*
      Delete $INSTDIR\*.*
      ;Borra Directorios
      RMDir "$INSTDIR\lib"
      RMDir "$INSTDIR\web-files"
      RMDir "$INSTDIR"
   SectionEnd
