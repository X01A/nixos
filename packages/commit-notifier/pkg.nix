{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "3af192a9ae3177e323cc22733363ff0efda4762d";
    fetchSubmodules = true;
    sha256 = "sha256-7O5vrJ4AeN+UKG8X5pHomBptDGrtu9/XI/tPKsxWP58=";
  });

  cargoSha256 = "sha256-EOWubaj/rAP7IwQoRK1r8cSmU2mTJ5i7/qt1aQ8x29Q=";

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
