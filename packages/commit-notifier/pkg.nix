{
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  zlib,
  libgit2,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2026-01-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8db71d60aa311aa5ca0e3b15fe43bfef1977b99f";
    fetchSubmodules = true;
    sha256 = "sha256-rhkqGrgU/O0OiV5MPzAq68KQcfek7fVOiKCYqDuSTts=";
  });

  cargoHash = "sha256-sPfaHXQHaadk+p4+lI+g5EicO/2NdZA4s5lKqaOQWUQ=";

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
