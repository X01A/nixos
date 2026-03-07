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
  version = "0-unstable-2026-03-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "959d821bb3ff52c67c45584c20244ee87777c5ca";
    fetchSubmodules = true;
    sha256 = "sha256-QtUyc7oVTPpYraN85iR6VGfzCweWE9ZnZl8emMe5rj0=";
  });

  cargoHash = "sha256-G/RP7qhqM90S2rR8rJhhj0X7DilYOU8x48Hz/meJt8M=";

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
