{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "0431224167adac39fb93b57faf66eb40e57696c5";
    fetchSubmodules = true;
    sha256 = "sha256-C1CXY/GsL7N78UyzTi8DAJ4jzDPeoy0tTv995+SnC7Q=";
  });

  cargoSha256 = "sha256-Q6XioEnpgmjJuPfo7cKzsC3yjDBrAB4i3JP/BWCw39M=";

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
