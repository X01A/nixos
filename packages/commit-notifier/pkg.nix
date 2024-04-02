{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "24c2b2d4b08609bd64c6632f27676716d905ebe8";
    fetchSubmodules = true;
    sha256 = "sha256-pxmgCPvkrDvu9WaQ94aFjKIYuOCUja5Li6WUyK8tG0o=";
  });

  cargoSha256 = "sha256-OwBy87/OtupKSOQ1WdanfWL67iTJAZoXlGmfMFR0j+o=";

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
