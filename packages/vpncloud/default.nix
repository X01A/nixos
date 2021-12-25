{ source, rustPlatform, lib }:

rustPlatform.buildRustPackage rec {
  inherit (source) pname version src cargoLock;

  prePatch = ''
    rm .cargo/config
  '';
}
