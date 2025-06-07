{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-06-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d4064339805b3105594841c9c438772cae88f667";
    fetchSubmodules = true;
    sha256 = "sha256-9Ac1PWaexOtvNCKQisUYngSX3QzxjWvrImw1wglDdRc=";
  });

  cargoHash = "sha256-72BsIUwOU9O3JWazN06VciikWBdyUM4j8R3bFV3Bch0=";

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
