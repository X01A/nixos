{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-03-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1e54eb4b19c047dbc8b8f7b8de5bab02f09c16d2";
    fetchSubmodules = true;
    sha256 = "sha256-vxfcx1ePNfwvYzwKe7uORvMTRSCEirIN/10OKIpodX8=";
  });

  cargoHash = "sha256-GI0jzSGHgDtQTpDABCNBURihA8GY124DdTzpVS9dwL8=";

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
