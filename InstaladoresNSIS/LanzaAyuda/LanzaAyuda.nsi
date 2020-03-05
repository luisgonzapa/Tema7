    !include "MUI2.nsh"

  ;Name and file
  Name "LanzaAyuda"
  OutFile "InstallAyuda.exe"
  Unicode True

  ;Default installation folder
  InstallDir "C:\LanzaAyuda"

  ;Request application privileges for Windows Vista
  RequestExecutionLevel user

  !addplugindir "..\Debug"
  !addplugindir "."

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
;--------------------------------

; No need to compress twice!
SetCompress off

  SetDetailsPrint textonly
  DetailPrint "Descomprimiendo $R9..."
  SetDetailsPrint both
FunctionEnd

;--------------------------------
;Installer Sections

Section "Instalacion"

    SectionIn RO
    ; Set output path to the installation directory.
    SetOutPath $INSTDIR
    SetCompress off
    DetailPrint "Descomprimiendo..."
    SetDetailsPrint listonly
    File lanzaayuda.7z
    SetCompress auto
    SetDetailsPrint both

    ;Create uninstaller
    WriteUninstaller "$INSTDIR\Uninstall.exe"

    ;Descomprime el archivo y borra el comprimido de la carpeta de instalación.
    Nsis7z::Extract "LanzaAyuda.7z"
    Delete "$OUTDIR\LanzaAyuda.7z"

    ;Crea carpeta en menu de inicio
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
    ;Crea iconos en el menu de inicio
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\LanzaAyuda.lnk" "$INSTDIR\LanzaAyuda.jar"
    CreateShortcut "$SMPROGRAMS\$StartMenuFolder\Uninstall.lnk" "$INSTDIR\Uninstall.exe"


SectionEnd

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...
  Delete "$INSTDIR\LanzaAyuda.jar"
  Delete "$INSTDIR\Uninstall.exe"
  ;Borra Directorio
  RMDir "$INSTDIR"

  ;Borra carpeta e iconos del menu inicio
  Delete "$SMPROGRAMS\$StartMenuFolder\LanzaAyuda.jar"
  Delete "$SMPROGRAMS\$StartMenuFolder\Uninstall.lnk"
  RMDir "$SMPROGRAMS\$StartMenuFolder"

SectionEnd
