{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c4a96060d32ccf812ab34737e495786d26bfcb56";
    fetchSubmodules = true;
    sha256 = "sha256-vQ7TIJnDPNA8S8j+CxPgSMQIBAJFucZke6h1INcZ58s=";
  });

  cargoHash = "sha256-w+nbTvqZxdPwBb6ILUEWG2RpynQhJ89Uphmp2JiSF7o=";

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
