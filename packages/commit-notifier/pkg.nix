{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "3cd9f6cc4c4adc303473eb11fde9e477bdb667df";
    fetchSubmodules = true;
    sha256 = "sha256-6m6M5IlSqX0V9Vwixi82XqrbX4n+07El6LCiuZQ1AHo=";
  });

  cargoHash = "sha256-oWd1xFvoQk68//504YV64PtfMFGo1eL6W4uVASlV7Kc=";

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
