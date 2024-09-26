{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-25";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "91321f1844a4afe7db8f1f16ac6b9ddee618f38c";
    fetchSubmodules = true;
    sha256 = "sha256-G3q/PKZ21pbzBitPT6MzcZzhN69yLUb+4hvXpJvbkq0=";
  });

  cargoSha256 = "sha256-O7+O12rvV+o0VaRCpEOgnBEWSUtP7Jm2BKSUP0e/bH0=";

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
