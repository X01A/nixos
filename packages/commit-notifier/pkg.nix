{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-12-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a0ecaaee1471518a6c0b628a794eef8241473faa";
    fetchSubmodules = true;
    sha256 = "sha256-u+LANr4EyGn+HUXTCzAk9w+7Ibf8lPy+2gRuQ46bTxw=";
  });

  cargoHash = "sha256-jrbhfLuHxzu5wKcwNzcOaAMWajVavFfMJc2FNzLVRBk=";

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
