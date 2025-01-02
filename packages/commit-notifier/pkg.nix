{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "0e5dfbdcbe27a9e211b718ff87385a30b2b50178";
    fetchSubmodules = true;
    sha256 = "sha256-P+uI0RzClwxsIFKVtxDPvewEkTqa7hzVLxbnH02bbOE=";
  });

  cargoHash = "sha256-dT3xHoY8QlyhY5Qhvfe53FxFEItfvsWOEp5VfHNpsGU=";

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
