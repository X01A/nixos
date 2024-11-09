{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "65a7a0e93651281e82faa38b6a2c8bb15f1882b8";
    fetchSubmodules = true;
    sha256 = "sha256-ujiEuVY0sheThRrt9kr3FhjQqwLamTcI0jIkEKt18gY=";
  });

  cargoHash = "sha256-X6syADjiRDcISWhX7IW+Z/mkhN/dKdCpxcpZGzNQ6Nc=";

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
