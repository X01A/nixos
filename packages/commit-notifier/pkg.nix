{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "db2057005d26027d6a3bea511d0a201eaebd1e86";
    fetchSubmodules = true;
    sha256 = "sha256-sY1H9BfZqlWMVwtFA3hR+iCJT3rWY9LYeCMXiStBNsQ=";
  });

  cargoSha256 = "sha256-InMorDiNhA48eWMSNNq4iWRBWcLElc/grpXgsuItS/M=";

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
