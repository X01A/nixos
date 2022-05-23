{ source, rustPlatform, pkg-config, openssl, sqlite }:

rustPlatform.buildRustPackage rec {
  inherit (source) pname version src;

  cargoLock = source.cargoLock."Cargo.lock";

  RUSTC_BOOTSTRAP = 1;

  buildInputs = [
    openssl
    sqlite
  ];

  nativeBuildInputs = [ pkg-config ];
}
