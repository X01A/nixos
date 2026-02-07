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
  version = "0-unstable-2026-02-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "93ad526940c60d3a7be65239e6ff8604ce8c6e17";
    fetchSubmodules = true;
    sha256 = "sha256-2U1Pp6v68fAxG6pVztHvCGe8FP714o9V2WQFMSmChBQ=";
  });

  cargoHash = "sha256-IezbCVH3C7i7COZ8Fw7aXym7Q64hy6jxo98aohxgOyA=";

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
