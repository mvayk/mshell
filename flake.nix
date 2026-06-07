{
  description = "personal quickshell configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    qml-niri = {
      url = "github:imiric/qml-niri/main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
    matugen = {
      url = "github:/InioX/Matugen";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      quickshell,
      qml-niri,
      matugen,
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      mshellPkg = pkgs.callPackage ./nix/package.nix {
        qml-niri = qml-niri.packages.${system}.default;
        quickshell = quickshell.packages.${system}.default;
        matugen = matugen.packages.${system}.default;
      };
    in
    {
      packages.${system} = {
        quickshell = quickshell.packages.${system}.default;
        qml-niri = qml-niri.packages.${system}.default;
        matugen = matugen.packages.${system}.default;
        mshell = mshellPkg;
        default = pkgs.symlinkJoin {
          name = "quickshell-niri";
          paths = [
            quickshell.packages.${system}.default
            qml-niri.packages.${system}.default
            mshellPkg
          ];
        };
      };
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          quickshell.packages.${system}.default
          qml-niri.packages.${system}.default
          matugen.packages.${system}.default
        ];
        shellHook = ''
          export QML2_IMPORT_PATH="${qml-niri.packages.${system}.default}/lib/qt-6/qml:$QML2_IMPORT_PATH"
        '';
      };
      homeManagerModules.default =
        { pkgs, ... }:
        {
          home.packages = [
            quickshell.packages.${system}.default
            qml-niri.packages.${system}.default
          ];
          xdg.configFile."quickshell".source = "${
            pkgs.callPackage ./nix/package.nix {
              qml-niri = qml-niri.packages.${system}.default;
              quickshell = quickshell.packages.${system}.default;
              matugen = matugen.packages.${system}.default;
            }
          }/share/quickshell";
          home.sessionVariables = {
            QML2_IMPORT_PATH = "${qml-niri.packages.${system}.default}/lib/qt-6/qml";
          };
        };
    };
}
