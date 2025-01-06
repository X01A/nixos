{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5a892754065937000b71fcdf2269d61340f450ec";
    fetchSubmodules = true;
    sha256 = "sha256-AYtP+ygJqTL2WT5uWCv2UoHt/MrKBRdOAt7XqMnv6yo=";
  });

  cargoHash = "sha256-+t7/ZkokjkCBlfkTkcyTkwnD3Uq7YgSm3SMUy3rysUM=";

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
