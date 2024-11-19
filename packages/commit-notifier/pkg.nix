{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9b3ff63976598a8844d10ea42a40c17d1db2d18c";
    fetchSubmodules = true;
    sha256 = "sha256-Qaq9gsSLZyAxgwwt2hYlm9I4duefjOStP1SBw7v4XIw=";
  });

  cargoHash = "sha256-tULez5YOfKY2EHCY5xItajyh0ceHGcNSOW+H85Kajk0=";

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
