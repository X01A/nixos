{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f53d2f02c215fa5da3ed6058ce2a9d3d5d7ac916";
    fetchSubmodules = true;
    sha256 = "sha256-rLAwV/OQGfRubVUokegSg0u/KJ7czRfEi4flcZqRBtw=";
  });

  cargoSha256 = "sha256-i8XvotyrYS9zV+1D7nrCq5aI2aBsadsrhHUoVkCxyag=";

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
