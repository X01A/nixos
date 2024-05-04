{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8f43c814ea23013c9aa044f2277b1e4e758cd596";
    fetchSubmodules = true;
    sha256 = "sha256-a2O/48XqHnCFMDU+YGcGGxvsvvj7xum30hNN9yC/aIM=";
  });

  cargoSha256 = "sha256-2QZJzS0CB71hdPuC50Gp3KUgZS6quZXBqaI6d2Njzfo=";

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
