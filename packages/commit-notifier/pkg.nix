{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "63f991c739e1b0f2770fc50f63c10e2844bddc0b";
    fetchSubmodules = true;
    sha256 = "sha256-WoiQhrVnwQbp+e1HvgZqdQPkHUl2xFWEOdKciSdn0x4=";
  });

  cargoSha256 = "sha256-z+kjx3miLC4TN+C6pZKP1K6iOZzmvmQ5gvXkmpGQpXY=";

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
