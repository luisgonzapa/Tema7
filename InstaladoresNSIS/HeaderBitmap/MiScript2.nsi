;NSIS Modern User Interface
;Header Bitmap Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file
  Name "MiScript2"
  OutFile "Instalador2.exe"
  Unicode True

  ;Default installation folder
  InstallDir "$DOCUMENTS\MiScript2"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "$DOCUMENTS\MiScript2" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel user

;--------------------------------
;Interface Configuration

  ;Añadimos Imagen de la empresa ejemplo
  !define MUI_HEADERIMAGE "images\apple.png"
  !define MUI_HEADERIMAGE_BITMAP "images\appleico.ico" ; optional
  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES

  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section "Dummy Section" SecDummy

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE...
  SetOutPath $INSTDIR
  File MiScript2.nsi

  ;Store installation folder
  WriteRegStr HKCU "Software\Modern UI Test" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecDummy ${LANG_ENGLISH} "A test section."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...

  Delete "$INSTDIR\Uninstall.exe"
  Delete "$INSTDIR\MiScript2.nsi"

  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\Modern UI Test"

SectionEnd
