{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e08bb366c3614093fbbc70e5c4de08131a49fa6e";
    fetchSubmodules = true;
    sha256 = "sha256-JPyjvIk+pSlOVdYyUKlOFGR8wUoFhbTNe0tw4fGRo0c=";
  });

  cargoSha256 = "sha256-FurT9ez/bX4zyHvqJrybh3uosIZH1FLw8xMfC2l2wsw=";

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
