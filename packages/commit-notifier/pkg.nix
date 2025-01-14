{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "7927d1fb7a314599459dcc66c803ef7d94ad23da";
    fetchSubmodules = true;
    sha256 = "sha256-B6T4PTdjyTgDhdrYPpyAscH+l1Fwm/s/CUcHJQ7Cckk=";
  });

  cargoHash = "sha256-Diz629tKbBXoIQv1xWxmLRgA3Hh5jJzZHJhSyG6BB8s=";

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
