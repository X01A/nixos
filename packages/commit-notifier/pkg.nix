{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5a73aeba67dd67191ae79e3251635a98f2a88ef1";
    fetchSubmodules = true;
    sha256 = "sha256-rR+dhS3YF3SBfOoUhVmqayflQDaRWp7WxhOIa15d6yo=";
  });

  cargoSha256 = "sha256-m8eC6lDJ2NC1gfZ81TMHyDnpMiKFV+VcBkR967aG4uU=";

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
