{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "050d1f4b0d9e2c711ece1d59c39c53ce03eccaeb";
    fetchSubmodules = true;
    sha256 = "sha256-cHwTy5ebYFZD5ucf5/xpSp6zv8qznaKnRaOVAwLJ2k8=";
  });

  cargoSha256 = "sha256-dzarJW8gglMs7HgkLKBSL8BtkcOO+viNewf0hSLdj9M=";

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
