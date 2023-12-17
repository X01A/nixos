{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "47f9d977369fb911c0f301afd6159d358a86addc";
    fetchSubmodules = true;
    sha256 = "sha256-ltdPCkDZQuphrCQL7dWtR/OyuZ75IYL1P94njSvMViE=";
  });

  cargoSha256 = "sha256-NEqniGyDnIBEpy9dFi039ATnB+Y0vqnxKtoew5FpEds=";

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
