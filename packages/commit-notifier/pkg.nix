{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6faa19366917b860404fa3eb678a0fc43200b7ff";
    fetchSubmodules = true;
    sha256 = "sha256-AE1GC9J86VSIcShrhvpyKzm7M0BBE2cx3tUOVGmjJvY=";
  });

  cargoSha256 = "sha256-t3IgXCScRMG3Cboi+xWQB2nFIgkJvbpk+dRTgG4EIUo=";

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
