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
  };
  outputs =
    {
      self,
      nixpkgs,
      quickshell,
      qml-niri,
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system} = {
        quickshell = quickshell.packages.${system}.default;
        qml-niri = qml-niri.packages.${system}.default;
        default = pkgs.symlinkJoin {
          name = "quickshell-niri";
          paths = [
            quickshell.packages.${system}.default
            qml-niri.packages.${system}.default
          ];
        };
      };

      devShells.${system}.default = pkgs.mkShell {
        packages = [
          quickshell.packages.${system}.default
          qml-niri.packages.${system}.default
        ];
        shellHook = ''
          export QML2_IMPORT_PATH="${qml-niri.packages.${system}.default}/lib/qt-6/qml:$QML2_IMPORT_PATH"
        '';
      };

      homeManagerModules.default = { ... }: {
        home.packages = [
          quickshell.packages.${system}.default
          qml-niri.packages.${system}.default
        ];

        xdg.configFile."quickshell".source = self;

        xdg.configFile."quickshell".recursive = true;
      };
    };
}
