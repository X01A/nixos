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
  version = "0-unstable-2026-01-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "74d95c00f7922aa2032dee0016f3df4dfe2b3637";
    fetchSubmodules = true;
    sha256 = "sha256-WZyWjom12nVYkCb+YrUhrCHLaZGJuOik0yrmreMNGj8=";
  });

  cargoHash = "sha256-z5t6JpSX7o3VI7DQIO65aBn5QajvtkeyAeWVDIThLh8=";

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
