{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d355f0e651958d73b90c909398988d59f1cfa82c";
    fetchSubmodules = true;
    sha256 = "sha256-Y3HAXSXOd1BQeAE6GRzyVcUZesCEWwo9P130NfLGGdI=";
  });

  cargoHash = "sha256-ZaASvimO1Kzjf9y7gB+1QgCaG6F9wwFoJeHx9vrfzhY=";

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
