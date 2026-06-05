{
  pkgs,
  qml-niri,
  quickshell,
}:
pkgs.stdenv.mkDerivation {
  name = "mshell";
  src = pkgs.lib.cleanSourceWith {
    src = ../.;
    filter =
      path: type:
      !(builtins.elem (baseNameOf path) [
        "flake.nix"
        "flake.lock"
        ".git"
        "nix"
      ]);
  };
  installPhase = ''
    mkdir -p $out/share/quickshell
    cp -r . $out/share/quickshell/
  '';
}
