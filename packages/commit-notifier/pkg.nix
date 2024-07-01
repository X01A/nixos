{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "89483753640df06e5d0a65fa67031f0eec5f800d";
    fetchSubmodules = true;
    sha256 = "sha256-cWSyeH39cimKqyDxeP7DeRckc7XEC7AYAmCLhzExJvQ=";
  });

  cargoSha256 = "sha256-Ia7FDy3C6bjko9EtVl/dp2MrPr6zUHluzV8UPqFUEIY=";

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
