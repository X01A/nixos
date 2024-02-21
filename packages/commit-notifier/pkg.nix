{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c0279390a325b2e6ef506a92faf2e4d876659757";
    fetchSubmodules = true;
    sha256 = "sha256-2RkigwnGRKCSqbA8SQdcOlQTaxMjzx4fMSdKQa8qxzA=";
  });

  cargoSha256 = "sha256-F2YP+Ai3M/L5fbGswjttP6QObxou3Y7M8ghdbn/24n0=";

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
