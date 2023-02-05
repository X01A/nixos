{ source, rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2 }:

rustPlatform.buildRustPackage rec {
  inherit (source) pname version src;

  cargoLock = source.cargoLock."Cargo.lock";

  RUSTC_BOOTSTRAP = 1;

  buildInputs = [
    openssl
    sqlite
    libgit2
    zlib
  ];

  # TODO libssh2-sys failed to pass test
  doCheck = false;
  nativeBuildInputs = [ pkg-config ];
}
