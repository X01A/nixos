{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-12-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f7a24bea671a2b9c89402bdbce8e310bbc1f09c2";
    fetchSubmodules = true;
    sha256 = "sha256-keqYYy9cucglhOsV84apEqr2kfWqjVyIRhkwuSQ0YCc=";
  });

  cargoHash = "sha256-3iFaId8LWoYcq2DuzNOeaPb8Cc7fYHb6PEcs/FAfn6s=";

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
