{
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  zlib,
  libgit2,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2026-02-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "2984a703632baa0ecbee8682e078a44bd36e8336";
    fetchSubmodules = true;
    sha256 = "sha256-kKFV8uh3RJbe8piNO3lmAooWnHDqUYgFxZUFXKDeA5M=";
  });

  cargoHash = "sha256-4X4bSqfnLCzxYnFx/iC84ArcVj/207Sft1Lxe5qVfxM=";

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
