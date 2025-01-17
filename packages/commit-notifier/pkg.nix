{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e236fbbd08e32ec94ddb51a2b46b41cae67562ed";
    fetchSubmodules = true;
    sha256 = "sha256-XlOgpCY8b4Z3ZaJv+iOk7m5p9oX3UmZ5bJBPNmyRWFU=";
  });

  cargoHash = "sha256-yIEBVpArmNJ3es4eja1cSGKITbXgcIF7GsUWE6eCdtU=";

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
