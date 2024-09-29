{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-28";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c617585a207a7f4da4742f8997cda3b099d82278";
    fetchSubmodules = true;
    sha256 = "sha256-Z30qM6iwQIAJOT7inrCswH2JikbURx6Tilj6ORCXd58=";
  });

  cargoSha256 = "sha256-ryUy366TXp8SI5rCormh5teQdI5rsvLZscdEcS8qeZ4=";

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
