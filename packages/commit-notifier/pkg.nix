{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "69c640841e1577832964ec7c0706e6f09791c867";
    fetchSubmodules = true;
    sha256 = "sha256-qQHh6aLUsotb0a0b/Eu3ijMk4/t1rjavh+8cDIoAwaA=";
  });

  cargoSha256 = "sha256-0nPHP/Bd6HQB17wDfAhhKyL6Vvyjjy4Pz5/Q2qt0JPQ=";

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
