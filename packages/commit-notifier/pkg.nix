{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-25";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "aea0fc6c8983b3f016b27b9263c6b12bb8103f42";
    fetchSubmodules = true;
    sha256 = "sha256-Lq5GhMJXJPkFdrRaqb3iY0YA7lTctHEOauKBIea7pnY=";
  });

  cargoSha256 = "sha256-jBHvBIP15EAXHb8mTGFPF54uRCLSQlnme868P/yymEc=";

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
