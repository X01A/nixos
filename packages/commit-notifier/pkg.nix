{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9554fb161655129979451ff15a06dcae7b9bf4cf";
    fetchSubmodules = true;
    sha256 = "sha256-HQQ8nmf6uAg1Nd5gJN2sP1OkHDXTKdtDCjW56INfvKs=";
  });

  cargoSha256 = "sha256-2NKXb7wtbzve81uwCVqJrppB04XKY+9N2OkLlQhoCYk=";

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
