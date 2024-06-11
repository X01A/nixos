{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "edae9bd7a0ef02a9b02e09994014a4d538127e3f";
    fetchSubmodules = true;
    sha256 = "sha256-q7RLRsZ4TZZ4M21+ZOcxK/FvStrQGU1LiO/H+s2cMIk=";
  });

  cargoSha256 = "sha256-Nom4Gni2ATxphX4E818y4i6fx4aX2tUtZXQHv9Nnzn4=";

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
