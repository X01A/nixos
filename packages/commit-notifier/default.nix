{ source, rustPlatform, pkg-config, openssl, sqlite, zlib }:

rustPlatform.buildRustPackage rec {
  inherit (source) pname version src;

  cargoLock = source.cargoLock."Cargo.lock";

  RUSTC_BOOTSTRAP = 1;

  buildInputs = [
    openssl
    sqlite
    zlib
  ];

  nativeBuildInputs = [ pkg-config ];
}
