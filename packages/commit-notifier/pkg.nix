{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9f5821e3361680142794c010bc5fe63e0855914d";
    fetchSubmodules = true;
    sha256 = "sha256-1pDn5Ok8W9ywuKCo+CCJB9A8+aRj1IwhvdejeYooPiM=";
  });

  cargoSha256 = "sha256-3wl6DZx8dV1EuWQdiAwKMaIKrLOLHJPZYYPYPjjztjc=";

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
