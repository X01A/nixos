{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e75dde2affb4bfca309f82603737dd25d93ddf31";
    fetchSubmodules = true;
    sha256 = "sha256-J6qKZLJvu/vK/7883Dreqjkx4I4IM09gNoh2Q/1BFbE=";
  });

  cargoSha256 = "sha256-UppNt8h+UABxKpY8JNWfxYg/LDNYbHUFG56HGMmScmI=";

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
