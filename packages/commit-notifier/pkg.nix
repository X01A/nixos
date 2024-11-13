{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "313cf3b6212f3fccfc25ab91ad092e50429fc66b";
    fetchSubmodules = true;
    sha256 = "sha256-1DicQPWlkD4jAdRe1sPSzU/ObLoHR8BXaRY7FE2R2K0=";
  });

  cargoHash = "sha256-bpvscta0t2hzrROtNZlNR7dolVL5cV0xV9B2sCSrytg=";

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
