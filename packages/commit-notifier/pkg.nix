{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "cd1bf1b5f0af804963bc72391c5e828a188d2d8d";
    fetchSubmodules = true;
    sha256 = "sha256-4/kKXDoumhro+/uZGsai2mX0h6QnwhOzY/kVsEEhIr0=";
  });

  cargoHash = "sha256-ItLPuY8ArohSe6Z/PoUkpFyyEBRA9HCW/IAobpCjAnA=";

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
