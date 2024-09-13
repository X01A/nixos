{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e3722f7c939bdd774f5bbe38a0e34dcb838e1692";
    fetchSubmodules = true;
    sha256 = "sha256-wR+3nGutAAyU28LHTaD8hpZ5FWFVaZyh/vgOvli8BYw=";
  });

  cargoSha256 = "sha256-UV6H6ToJ72vAbTGA5qwC31aWnVE3ScnJE0orMmwvCcw=";

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
