{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4e5fd3c81aabe406c4a4de09f6a49fc7a63115cf";
    fetchSubmodules = true;
    sha256 = "sha256-h+J1nt/ibKUHVYF9beJT/A1HdXN5+4+UtHANetPVIsY=";
  });

  cargoHash = "sha256-iGMO0JY/yEpyTmZBiBFfC84/lmVnz8tJSqvd/kmSG9k=";

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
