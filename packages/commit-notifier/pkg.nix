{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d8f702b0b6c0ff7e5631999d3398d6ee66fbfb8d";
    fetchSubmodules = true;
    sha256 = "sha256-b04NmJ/X7YxQDC08sJrtWRseVoBcCIDAaOTxDBLIkXg=";
  });

  cargoSha256 = "sha256-gTLHr//wbHPSeSTmfmx0DdUSwXdDiMgkghU+XokgmZ0=";

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
