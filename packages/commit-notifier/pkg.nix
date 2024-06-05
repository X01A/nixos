{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f337149a28d02b69f8cefb973dc7ca7e1ae1482b";
    fetchSubmodules = true;
    sha256 = "sha256-gzYpWlWzvw2RqO1VyAwVLkyPvS+Sg7y7M+VUgoyCdvA=";
  });

  cargoSha256 = "sha256-gOTqAWh9aI4luM+xyCsFwCOeQcjRl35Scz2sR4nMdFs=";

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
