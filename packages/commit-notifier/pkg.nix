{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "b3d27bbab43e4226133679c0233a05dea6366447";
    fetchSubmodules = true;
    sha256 = "sha256-abBuvi634HGng73kzfBSumlourf2EtVNJjBGyEkTEMs=";
  });

  cargoSha256 = "sha256-oBg5vhgBlndgAVv/CH0LHoRABnTjyN3pG0pVnHxZVCs=";

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
