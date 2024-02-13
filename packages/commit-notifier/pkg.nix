{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "baf45f9296d14f9af847d7ef91e48f11a2d716ff";
    fetchSubmodules = true;
    sha256 = "sha256-FZnH9mZ0QZ7xSx8ZDtYPSEH6ZQJW4KzIVnxJomRlsrM=";
  });

  cargoSha256 = "sha256-sbZp94z6d5aiDKQk+y8kBkvzIkZ+Wp0va6CTYIrbpak=";

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
