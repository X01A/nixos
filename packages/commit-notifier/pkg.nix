{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4946ed867709edf2a555c067d28d718230c15bff";
    fetchSubmodules = true;
    sha256 = "sha256-y32eJvGkCcplU6xrbUwr4hiUOT/1FybofCKqX3T974s=";
  });

  cargoSha256 = "sha256-D4TaWhpBl3RNUPVwy8ssH0u+Bes+Tcu7qH2cBhb5dQE=";

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
