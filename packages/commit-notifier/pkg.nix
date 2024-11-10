{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-09";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "af849276af85e88fe8bf48d6c3d5a99e1415a8f2";
    fetchSubmodules = true;
    sha256 = "sha256-bgyOHEg1LfIQ+lmKs4UqRT2S5OfkfUG8H2QtgRjXikc=";
  });

  cargoHash = "sha256-ErOgqugs79bik/FqWNY+1lPRdJabGvrjJqYsNq6vjF0=";

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
