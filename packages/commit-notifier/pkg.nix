{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-03";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e8f595e1dd3ed93eee7e6d9f266c21e9c599a0e7";
    fetchSubmodules = true;
    sha256 = "sha256-t7AAd8vc5L9osE9fux6qMfKhYbYAmrH8TZhcV6uP2oA=";
  });

  cargoSha256 = "sha256-sbD2beSonJfnuTyNRTLQgmgmrVDEywMFUOfSUXtiSuU=";

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
