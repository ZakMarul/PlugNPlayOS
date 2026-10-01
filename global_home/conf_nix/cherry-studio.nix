{ lib, appimageTools, fetchurl, makeDesktopItem }:

let
  pname = "cherry-studio";
  version = "2.1.3";

  src = fetchurl {
    url = "https://github.com/CherryHQ/cherry-studio/releases/download/v${version}/Cherry-Studio-${version}-linux-x64.AppImage";
    hash = "sha256-LkGun/zuJccNXQL/pnn+R9tF+VopBhg6Jh/Z7QVVbWw=";
  };

  contents = appimageTools.extractType2 { inherit pname version src; };

  desktopItem = makeDesktopItem {
    name = pname;
    desktopName = "Cherry Studio";
    comment = "LLM frontend";
    exec = "${pname} %U";
    icon = pname;
    categories = [ "Utility" ];
    mimeTypes = [ "x-scheme-handler/cherrystudio" ];
    startupWMClass = "CherryStudio";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm644 ${desktopItem}/share/applications/*.desktop -t $out/share/applications
    # ikona iz AppImagea
    icon=$(find ${contents} -maxdepth 1 -name '*.png' | head -n1)
    [ -n "$icon" ] && install -Dm644 "$icon" $out/share/icons/hicolor/512x512/apps/${pname}.png
  '';
}
