{ source, rustPlatform, lib }:

rustPlatform.buildRustPackage rec {
  inherit (source) pname version src;
  cargoLock = source.cargoLock."Cargo.lock";

  prePatch = ''
    rm .cargo/config
  '';
}
