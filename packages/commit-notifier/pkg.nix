{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9594ae8aeee52189bbf2fc2ac6b92200f81e9ff0";
    fetchSubmodules = true;
    sha256 = "sha256-eIj0gb1jIgyNVlx9yXUheApoOipZ76nuQ8kd1OnXxvk=";
  });

  cargoHash = "sha256-2Lc0IkmD8pQCsd9SlyZOucZ0+oFL1MZaHplhdoGZrM4=";

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
