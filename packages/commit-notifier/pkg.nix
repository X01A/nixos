{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d14d0cac444da36381150017350ba0cbf26dd915";
    fetchSubmodules = true;
    sha256 = "sha256-sLQZRuCXZdS++gWADdZoaDATDTMJYgfeOuYjlXA/q/k=";
  });

  cargoSha256 = "sha256-BzieM7ug8nj9PmOGtkZVOISFbQcJgCZWfpjyxAZWXVI=";

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
