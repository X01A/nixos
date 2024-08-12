{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9a772b502cae41afef2384a6d401ec69ec978a36";
    fetchSubmodules = true;
    sha256 = "sha256-ZPuaK3BcDEeM1/J35L6OCYfIjUmgYqKJiANQcuUwlvM=";
  });

  cargoSha256 = "sha256-hwDH2X5H/qve+NnTP94garRVvCer8kmfZSnu04dICfQ=";

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
