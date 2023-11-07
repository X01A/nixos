{
  perSystem = { inputs, config, pkgs, self, ... }: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        nvfetcher
        nix-prefetch
        nixpkgs-fmt
        nix-update
        bash
        shellcheck
      ];
    };

    formatter = pkgs.nixpkgs-fmt;
  };
}
