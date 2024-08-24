{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c19aacfce0547bf15bf47a8737b11f887e5c0ef1";
    fetchSubmodules = true;
    sha256 = "sha256-HVic6vYq0QDvgWA2H2aLu/VEOGZaVB968VJoA9iXwGI=";
  });

  cargoSha256 = "sha256-wDYavp8E2fy2fuqBViAFOd4kolLpUjZaycVkEWL8ooU=";

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
