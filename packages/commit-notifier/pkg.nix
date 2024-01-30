{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "cf0d93af3038d1b47f5336d97d7bc4626ea06dcd";
    fetchSubmodules = true;
    sha256 = "sha256-KqYuJl1/GAy4TExvU2E3EuravQ5fQfk8v0Nz+Bvn1pY=";
  });

  cargoSha256 = "sha256-vRevi6Z3ToUiJTcJGQDu936vcYFHWTZE5tzUVgodfM4=";

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
