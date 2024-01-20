{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "2f6ec393250bb38f7a829ee778e356486a2e28ef";
    fetchSubmodules = true;
    sha256 = "sha256-g4Z5+MiNHINcocKQWqgKD0zuRP+4nbYJ9nL0RDOjtdw=";
  });

  cargoSha256 = "sha256-PyakmaHXsk2hItrCmVUts96YwxuDrz+ALn3XymwYk88=";

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
