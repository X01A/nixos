{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-03";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "7df9dff91fcef666cb68f68e4c3770b27cf21e87";
    fetchSubmodules = true;
    sha256 = "sha256-O7PlnFdjW2c3VodE49M/Lu4OPYMuRScLXBxfE4ZrrwM=";
  });

  cargoSha256 = "sha256-dTh2Oab150aswKVg/24u0pMTz8HQo57JIUT4YSFkOTA=";

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
