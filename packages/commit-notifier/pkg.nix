{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9c054011f52cd5c7e01aefabf9784643292a2749";
    fetchSubmodules = true;
    sha256 = "sha256-QNMFgeUzI4Hio0tZzWZmUNtnX//quWFrlAEkmCUhp7c=";
  });

  cargoSha256 = "sha256-6vBcnFCB50SqsNPM99F81mSZq7Qm3MSzeMHk3MVtCZI=";

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
