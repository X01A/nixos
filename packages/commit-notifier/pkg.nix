{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "af1b33dbf146af336fae42b485d42d2cba548882";
    fetchSubmodules = true;
    sha256 = "sha256-xM3vhkMZcbwKhLmjHt/lfeM4uQekaJDWb9HJceVhJLM=";
  });

  cargoHash = "sha256-fsjvpzxjZq6JPdkIB4IW/WwYsDWDqOLJbiaToSSiIM0=";

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
