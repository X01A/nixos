{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a1856598e8e698627823fc0113ea558711d1f365";
    fetchSubmodules = true;
    sha256 = "sha256-42LQQbhXzrADdNaMrYrX+PxWuwP0oPZGTdqC+4Pee3E=";
  });

  cargoSha256 = "sha256-TTa8Gn7/u8Kw2QEFi8xkLkNKV/C6HVF5sc2DSjxRx1A=";

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
