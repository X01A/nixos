{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "48626c4a6bfa25816a9c5ca24bb4ea483ba2d9c2";
    fetchSubmodules = true;
    sha256 = "sha256-MuRM73HuH6JyrIiEiJWejZiN+xA5/R17VDYSJGeau+c=";
  });

  cargoHash = "sha256-FTZmS19FKvEngghV1PoA6o98cjUF2rTJiwife4mKm9c=";

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
