{ source, rustPlatform, pkg-config, openssl, sqlite }:

rustPlatform.buildRustPackage rec {
  inherit (source) pname version src cargoLock;

  buildInputs = [
    openssl
    sqlite
  ];

  nativeBuildInputs = [ pkg-config ];
}
