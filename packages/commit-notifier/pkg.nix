{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ce90bb3dc9265ecee0ec345078451847230d846b";
    fetchSubmodules = true;
    sha256 = "sha256-umrdkJ5mc9FrbAOgUw71fYyLOjrTCvKUy9ImlrdS2RU=";
  });

  cargoHash = "sha256-UfssiCQA7mp+YE4Z0EnWeA9dewTtjkZc1pQhx/TB63k=";

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
