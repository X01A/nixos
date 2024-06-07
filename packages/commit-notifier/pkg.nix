{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "dba586fcb128c47a08d2b90f12800399036260a8";
    fetchSubmodules = true;
    sha256 = "sha256-Uejd64EQd//jNtUYZGNk1p4DEZLk/YT7Z72Njcq58qM=";
  });

  cargoSha256 = "sha256-TU/YOlvwt+oimNp5r0JD2VziM9utQ2g8440hh85KeLI=";

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
