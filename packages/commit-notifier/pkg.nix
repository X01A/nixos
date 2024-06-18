{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "fccf25c263ef704fa9cc350506429f0e2f093a90";
    fetchSubmodules = true;
    sha256 = "sha256-LXvirnK8ZU1pv1b89DL8p7EKfUeJA3NrQWUIJLmApXE=";
  });

  cargoSha256 = "sha256-iRiU0G5kjQXssSVqAKeCyL8wu6Kud82zs7qOPIuoQ5M=";

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
