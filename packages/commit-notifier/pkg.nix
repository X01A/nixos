{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "217c602e245fc2a243bc81a4615b1de867ae6d82";
    fetchSubmodules = true;
    sha256 = "sha256-ZV6qBmT/zhLzzbPcLTnfaROtgGbdF37TxM7+D0H/aZA=";
  });

  cargoSha256 = "sha256-27jwbhTNCyjxRT+VOyuj1Ct/BRpcFnzhhKrrDeKR9Yg=";

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
