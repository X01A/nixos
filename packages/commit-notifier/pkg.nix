{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "19e0c1ed2e33d6135de7cc6c95e7db70f3493fb5";
    fetchSubmodules = true;
    sha256 = "sha256-c7H1hvq9ysL/sHeUBxWnPXPeOWvUZkFxkgnQwWuSTMo=";
  });

  cargoSha256 = "sha256-Vw06ykLyIDIDDWn06ETxMZ8JdrUfgUSx+1ycAkl1CN8=";

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
