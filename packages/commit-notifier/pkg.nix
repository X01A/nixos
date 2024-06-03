{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "03d9293dbac7b17154b208a9570a9ce63dbe7e00";
    fetchSubmodules = true;
    sha256 = "sha256-vlXyOGEJcSWzu6KDMbEeExwzHCL/XbKBlzLQDY7slxE=";
  });

  cargoSha256 = "sha256-SudHEmK4qGgMMFR8KNZa0ZSR76MZLt94ZSSRKjRK8qE=";

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
