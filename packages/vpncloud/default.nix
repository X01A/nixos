{ source, rustPlatform, lib }:

rustPlatform.buildRustPackage rec {
  inherit (source) pname version src;

  cargoSha256 = "eE+RBGdkfH+KMyBfFTMLP2SamwZs/0+MBm5YWiJGAoA=";
}
