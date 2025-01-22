{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "64764afec39d01736dd649379c1c48a832d327b0";
    fetchSubmodules = true;
    sha256 = "sha256-mHEKU2q2PCraQVdg1n6IaYZIbPj1b3QcUHcvcZVvMY4=";
  });

  cargoHash = "sha256-KDXeIz2yBFJGLA0iXl/LmgS0gjakERoS2eeIi0y0pzI=";

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
