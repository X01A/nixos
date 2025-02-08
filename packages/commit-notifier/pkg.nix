{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-02-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a9cf62e2c171b67692626a8fdae2b915f0d6226c";
    fetchSubmodules = true;
    sha256 = "sha256-kukItfUAhbgpd5z/JkhFNAvXWedgq+YWHDDwsgjtroM=";
  });

  cargoHash = "sha256-5MwZLUVPcObTiGL1Ik6ERY6zyz6JWhsI0GDFaXYJ4iI=";

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
