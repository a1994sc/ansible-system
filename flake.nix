{
  description = "Alpaca Flake";

  inputs = {
    # keep-sorted start block=yes case=no
    flake-utils = {
      inputs.systems.follows = "systems";
      url = "github:numtide/flake-utils";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    pre-commit-hooks = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:cachix/pre-commit-hooks.nix";
    };
    systems.url = "github:nix-systems/default";
    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/treefmt-nix";
    };
    # keep-sorted end
  };

  outputs =
    inputs@{
      # keep-sorted start
      flake-utils,
      nixpkgs,
      self,
      treefmt-nix,
      # keep-sorted end
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        treefmtEval = treefmt-nix.lib.evalModule pkgs (
          { pkgs, ... }:
          {
            projectRootFile = "flake.nix";
            programs.dprint = {
              enable = true;
              includes = [ "**/*.{json,md}" ];
              settings.plugins =
                let
                  dprintWasmPluginUrl = n: v: "https://plugins.dprint.dev/${n}-${v}.wasm";
                in
                [
                  (dprintWasmPluginUrl "json" "0.19.4")
                  (dprintWasmPluginUrl "markdown" "0.17.8")
                ];
            };
            programs.keep-sorted.enable = true;
            programs.nixfmt = {
              enable = true;
              package = pkgs.nixfmt-rfc-style;
            };
          }
        );
        pythonWithPackages = pkgs.python3.withPackages (ps: [
          ps.requests
          ps.kubernetes
          ps.semantic-version
          ps.jmespath
        ]);
        shellHook = self.checks.${system}.pre-commit-check.shellHook;
        buildInputs = self.checks.${system}.pre-commit-check.enabledPackages ++ [
          pythonWithPackages
          pkgs.mdbook
          pkgs.ansible
        ];
      in
      {
        checks = {
          pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              # keep-sorted start case=no
              check-executables-have-shebangs.enable = true;
              check-shebang-scripts-are-executable.enable = true;
              end-of-file-fixer.enable = true;
              nixfmt-rfc-style.enable = true;
              trim-trailing-whitespace.enable = true;
              # keep-sorted end
              file-format = {
                enable = true;
                name = "Run Nix format";
                entry = "nix fmt";
                pass_filenames = false;
              };
            };
          };
        };
        devShells.default = nixpkgs.legacyPackages.${system}.mkShell { inherit shellHook buildInputs; };
        formatter = treefmtEval.config.build.wrapper;
      }
    );
}
