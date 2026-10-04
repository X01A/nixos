update-nixpkgs:
  nix flake lock --override-input nixpkgs github:NixOS/nixpkgs/$(curl -s https://yet.nixoscn.org/l)
