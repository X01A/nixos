{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "470f1b17ab3d0e8b2140f8762997270c58815098";
    fetchSubmodules = true;
    sha256 = "sha256-zMWj6Cgvpkx6opPbOXNHiCN9w6GggQZrBEMUiaKn4gU=";
  });

  cargoSha256 = "sha256-0QtM6VFtqDv67McL4QGUFB4S1LZwmfW/oRhATq14J68=";

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
