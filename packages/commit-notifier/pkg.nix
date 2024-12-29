{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-28";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "33ed23970b1abe1bd31110b388c26a7a9a34a263";
    fetchSubmodules = true;
    sha256 = "sha256-5VN20WQqopgzsPsAOWU+crqe2nqeYCuIFTLBwfgzE/k=";
  });

  cargoHash = "sha256-ThVe+XOquDUZjhSP/crEJmGlOTsXD1qfEk58awgwOAE=";

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
