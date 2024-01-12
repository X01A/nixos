{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a2c2e403c9c8aa694e3d2829a4b842b6263b9f91";
    fetchSubmodules = true;
    sha256 = "sha256-ewyQ+IX3lVBcaJsUFaz0IJzOTZnbn6oj02piGcG+Ftg=";
  });

  cargoSha256 = "sha256-o4OEFx3xqspPntrdP348YcH+su61NZ7fIyJOJhMmKTM=";

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
