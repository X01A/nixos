{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "122ccb5a1871601fad1a92cdda499f4f976b76d9";
    fetchSubmodules = true;
    sha256 = "sha256-YZEtBAc7AMur2ms0rHjgEYGk7YN1Cc0nTV2YHaeh0T4=";
  });

  cargoHash = "sha256-5e1620sHomCFQej9aAlF6328b0X9HlbZBQf8VlOuiaA=";

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
