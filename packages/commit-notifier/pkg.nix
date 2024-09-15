{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "bbce99443ed780af2e5c0c6d9f05c839fe5a2f49";
    fetchSubmodules = true;
    sha256 = "sha256-PZuES4jmTs0y9Rod68iEY+DZauHYsnuAOfkaiBiyFNY=";
  });

  cargoSha256 = "sha256-nApDEt/NYk7vb6+N8fn3ruW4nvr5MPuXi5HjRifMa6Y=";

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
