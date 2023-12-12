{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "715811bdd67580bd1b47ab0711f90845f65ed2e2";
    fetchSubmodules = true;
    sha256 = "sha256-ZM6xoyV09NEaUy7HwHhgnO5U0C1Du39Fx/i35xWkk8o=";
  });

  cargoSha256 = "sha256-xk96zD4e3SMfRgdlMC1OpP30BZxUVj2OzjFaWsHPjCo=";

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
