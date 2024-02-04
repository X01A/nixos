{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "422416501fa91a0dbea816a2687236f61343d99f";
    fetchSubmodules = true;
    sha256 = "sha256-7C2gTEnHeGZBKzP5uEKOOkqiLFDYCK2A9rp9sfaGAJs=";
  });

  cargoSha256 = "sha256-R/KrjKWbdKWfZJ1EytNQTi6dh9giChB1D6YSmQjrBUw=";

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
