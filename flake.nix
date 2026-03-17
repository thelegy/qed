{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      flake.overlays.default = final: prev: {
        qed = final.callPackage ./default.nix { };
      };

      perSystem =
        { system, ... }:
        let
          pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [ inputs.self.overlays.default ];
          };
        in
        {
          packages.default = pkgs.qed;
          packages.qed = pkgs.qed;

          checks.stylua =
            pkgs.runCommand "stylua"
              {
                src = ./.;
                buildInputs = [ pkgs.stylua ];
              }
              ''
                cd $src
                stylua --check lua/
                touch $out
              '';

          devShells.defaults = pkgs.mkShell {
            inputsFrom = [ pkgs.qed ];
            packages = [
              pkgs.lua-language-server
              pkgs.stylua
            ];
          };
        };

    };
}
