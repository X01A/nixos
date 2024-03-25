{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-03-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8bc96cd40297680185ba12845f9a4280016a26a9";
    fetchSubmodules = true;
    sha256 = "sha256-76oUT/w66hLbVDyMwMrb5lMtm844r8I7VpFYUpyWpew=";
  });

  cargoSha256 = "sha256-QdH9o7bd+nbwlt30YM9Ol7948z98irHXU5xHbR0wSoU=";

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
