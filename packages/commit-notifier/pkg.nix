{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "dd6a441570019f364ce95ae5a74272a4c13e999e";
    fetchSubmodules = true;
    sha256 = "sha256-Qtx9uitu3zJFPl6M14xNeTB6+qIJhq6vPoRtvLoTcLg=";
  });

  cargoSha256 = "sha256-Nd++PynoC/ruOBPBfCNs0kTgaOq55jjvMKBSZ3rZkV4=";

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
