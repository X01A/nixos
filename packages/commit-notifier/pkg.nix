{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "3ff8df7cb0f610d8f98f7dd52d7f1aad1a7ae13b";
    fetchSubmodules = true;
    sha256 = "sha256-vziCPKEytqYOaVCtY4M6eOuN4BMkyJHSuvNOeNwakU4=";
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
