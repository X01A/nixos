{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "0a65e1d6760c7f55060ca273bad159164f6b19c3";
    fetchSubmodules = true;
    sha256 = "sha256-9B9MrTQQ2a7N8z6vhyo6uYQFoTd2Q2gZb9Mk/fkbkHU=";
  });

  cargoSha256 = "sha256-qnn2+lPVgLi8rxGqYnsWETMp/iKhLlpmVv1iIbhXBIo=";

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
