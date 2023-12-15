{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a16f7b4c6aea14ef56cf8281e6d0f9350297f963";
    fetchSubmodules = true;
    sha256 = "sha256-tdn3X0EWrz1q9n32HKZn5GLfYz4jFs1gz9H+EqDDXuE=";
  });

  cargoSha256 = "sha256-Sma935YIXC0PrxympsP2UwSm/Fiao9cPur1F1uqRaXw=";

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
