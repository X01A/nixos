{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "880043a212b69fa17972369a4e02eed35e8a589c";
    fetchSubmodules = true;
    sha256 = "sha256-IOPAOyv6+fK5npuM2BhZiLdrDytWd7sznHaFPDeACeA=";
  });

  cargoSha256 = "sha256-EOCXtAqQHbOIR96s05rb6gFqM5H4Oe99IyA+Tpz6bqM=";

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
