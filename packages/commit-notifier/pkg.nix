{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f484812087f4b2d290d17090e1926e8a421cec94";
    fetchSubmodules = true;
    sha256 = "sha256-H7AKyK6MpcBvwSEEY9elLX/MqqhRYenIjJmi1ywxY7Q=";
  });

  cargoSha256 = "sha256-o2HWKtEinrfP4X4GdPog1SnC9a6L519C/iVnDl0Le6Y=";

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
