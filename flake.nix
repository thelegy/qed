{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.flake-parts.follows = "flake-parts";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      imports = [
        inputs.nixvim.flakeModules.default
      ];

      nixvim.packages.enable = true;
      nixvim.checks.enable = true;

      flake.nixvimModules.default = ./config;

      perSystem =
        {
          config,
          pkgs,
          system,
          ...
        }:
        {
          checks.stylua = pkgs.runCommand "stylua-check" { nativeBuildInputs = [ pkgs.stylua ]; } ''
            stylua --check --config-path ${./.stylua.toml} ${./lua}
            touch "$out"
          '';

          devShells.default = pkgs.mkShellNoCC {
            inputsFrom = [ config.packages.default ];
            packages = [
              pkgs.lua-language-server
              pkgs.stylua
            ];
          };

          nixvimConfigurations.default = inputs.nixvim.lib.evalNixvim {
            inherit system;
            modules = [
              inputs.self.nixvimModules.default
              { nixpkgs.source = inputs.nixpkgs; }
            ];
          };

        };
    };
}
