{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-03-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "19d6f437845b43cd9c149bc1553d3ed2b5ed9956";
    fetchSubmodules = true;
    sha256 = "sha256-ST+/eHJNZuOJ3J17QHeXVxLTtyRL5XRN3J1y1vGNXNw=";
  });

  cargoSha256 = "sha256-AMEC/92p+AW0JFsjbbQbo1cVWqBjKljtxYKOdjrbGz4=";

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
