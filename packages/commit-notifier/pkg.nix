{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d2c0fee46c75134440c946ce46af8ffbba1a5581";
    fetchSubmodules = true;
    sha256 = "sha256-s8Ve2HiZ4U/dzk8U0zTb5ESA2mlQIgE4V+7pn5GrjZY=";
  });

  cargoSha256 = "sha256-+C8NfUGUJ2e6qF1b8iyjSGWDnKGrvKSDiDior/+Ffu8=";

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
