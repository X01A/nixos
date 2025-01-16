{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8146989b2e1d71c9513eb724d2205d693ddaa23b";
    fetchSubmodules = true;
    sha256 = "sha256-iyTlACyHE8g6pHu5sHD2JyBXS0xZeIB1ON5io3Jr/4s=";
  });

  cargoHash = "sha256-OexEhyujaiatpZKR+TvkwTK2H1IOCok4XCLSyMHQTSE=";

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
