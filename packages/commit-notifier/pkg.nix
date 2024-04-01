{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6bd012f3033dff8b67786c677afb82f8e5ed10af";
    fetchSubmodules = true;
    sha256 = "sha256-twsCekPovrLp1n4i/v79iuy0Vq56VRWs2DtRa1j/T3I=";
  });

  cargoSha256 = "sha256-qSTInIvte9PmwXPtnibScbC7rjFOB3jYw3G0q2G388w=";

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
