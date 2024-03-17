{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "3d3587826f794c377b47a30a8a77bf2a7c39c5aa";
    fetchSubmodules = true;
    sha256 = "sha256-q2bh5vQl0sMn/FiWBRdwidXKVp6Xln7tRCZha0h8img=";
  });

  cargoSha256 = "sha256-E0F1DCzxA4yrEYunYlIcm7CEBHRSVG9pAf0/8W4rfQo=";

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
