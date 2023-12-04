{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-03";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4a5fe7dc8f495a0d696769b6f83567c65275b8d5";
    fetchSubmodules = true;
    sha256 = "sha256-6n5klY15qw+ZhY9js9d/ExIcOmyCfZwlXzsZ7fxtDxs=";
  });

  cargoSha256 = "sha256-fpwApd2Q0stBTB+uzKmuJhD7LuFOXlFPMeUQ+ExL9e8=";

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
