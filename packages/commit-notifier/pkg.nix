{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f85b01ca887857c16dfb42b7118d8c144e76517c";
    fetchSubmodules = true;
    sha256 = "sha256-QRxLPWfrcoKpWFbRNJDj2bngywx0sSFEUnRiXC0Q1Xs=";
  });

  cargoSha256 = "sha256-z0U7yHjs0A9X5LUGKkAwpDAq9zrOXOUdCtMd+7LDJnY=";

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
