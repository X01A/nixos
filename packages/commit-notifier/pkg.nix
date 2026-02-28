{
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  zlib,
  libgit2,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2026-02-28";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "7730c950bb7f5885c9c72d80dcd8e8c1cf2392f9";
    fetchSubmodules = true;
    sha256 = "sha256-ot2bAjTPRQxKopfSEjMcHRF1ojuNJ7NMjjIa8Fss2zA=";
  });

  cargoHash = "sha256-rGFFixXKKUcA2M5XYpcu8Ce71OLsk8XRS4VzK1jyEPo=";

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
