{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-04-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9b1f9186f12d69c393ab055780581463ec6eeb3d";
    fetchSubmodules = true;
    sha256 = "sha256-G69uarYstKAGFV0AtJmxP6HlRN7MmccGt38WbfEyIaM=";
  });

  cargoHash = "sha256-VMAwemlCiS5d4RFuhAivWr7UTIagPPQcOsn5Xp74Y5Q=";

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
