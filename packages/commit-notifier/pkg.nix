{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1e11f3c285ae1ab045080254af8f450d4e75398a";
    fetchSubmodules = true;
    sha256 = "sha256-x1icfRBiAq16NZ0rZNsAaqzYRC+bixBiZsGXOYs0n38=";
  });

  cargoHash = "sha256-8jCDrJIbk2bOtZLYm4QnH4R2u+mYbF3LuIViaDd+lyc=";

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
