{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "117342af4daba90466ad6bb0de56471978d681b7";
    fetchSubmodules = true;
    sha256 = "sha256-TKiC0CxJLRSzKAHzdsT+ydIvn+SC/TDy+r/ULIyU8x0=";
  });

  cargoSha256 = "sha256-HTikex3bme67zZUZbg+gMFW+60rE5V7b6/ELAm7H574=";

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
