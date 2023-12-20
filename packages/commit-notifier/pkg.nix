{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "82273f010728cfa6b223e2205fac79677283dd5f";
    fetchSubmodules = true;
    sha256 = "sha256-3ELsKYXSLMMdMusFa7sOs5/3+3lyPdMG5Ov/92xi5lo=";
  });

  cargoSha256 = "sha256-IP0gV0puvEakA/GJ74z2KqnTcKl8/bdmrx7snbFHSpA=";

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
