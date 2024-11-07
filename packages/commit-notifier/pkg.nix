{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "eada75eceaec1eee87deafdaf95516b6b3177156";
    fetchSubmodules = true;
    sha256 = "sha256-XqgYSdMfvAGpyRL4wcEtoT7jy3CHT3V9XFpWI3jWoZg=";
  });

  cargoHash = "sha256-UbVdSoVzaLWnfBjOMLG/rA8AbFyZqCgW4CP7dvzgusg=";

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
