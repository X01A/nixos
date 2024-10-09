{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5e26dfe636f1585ca7ccf111778d51b39d35f4bb";
    fetchSubmodules = true;
    sha256 = "sha256-BYMdQe162wE2FMCzy+zxXyV25/W9zTEYJMGeW3wb6J0=";
  });

  cargoHash = "sha256-EdDlAhmEvQxFH/2rDoZY5diVGi20G2fnwxIpJe1v+A0=";

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
