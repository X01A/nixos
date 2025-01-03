{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "0f7e9d5f9a59569541cf731e6483ffd2c68072eb";
    fetchSubmodules = true;
    sha256 = "sha256-TWknUqoaPzvgH6+axuYdSaX4pSkkVNT4k2iJ2khxtN4=";
  });

  cargoHash = "sha256-6KpDWE7eTnXqiW7pjOQZ9RGdlYZefvNTsKyt+ElmZN4=";

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
