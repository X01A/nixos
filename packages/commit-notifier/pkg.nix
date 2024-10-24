{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ed26be49cac5850e1d76740548d6753392110f1f";
    fetchSubmodules = true;
    sha256 = "sha256-eBV7wAivwQ3A1vO4EjL8mutAq1otwuccpGtYsYDB41E=";
  });

  cargoHash = "sha256-kwvD3YqeHItDgzpGedttVkC2i4c7SMa2SloEZl7sz7s=";

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
