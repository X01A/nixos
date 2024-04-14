{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1d8b044e8eac70a8cf1d2c3b20082f3a9ab65aaa";
    fetchSubmodules = true;
    sha256 = "sha256-edQkqRLxMr2psYg51KFSl5g3FPIHUBdt4SOuZCejBhU=";
  });

  cargoSha256 = "sha256-K7w+fYt5pMVl2gJRQpa+mDa/aaX5k8eh9miz18Gc5i8=";

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
