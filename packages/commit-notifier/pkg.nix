{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d128a20f5f6d32f5463fde974d012ec9c0e4396a";
    fetchSubmodules = true;
    sha256 = "sha256-4+f3AkMHNGt5RSC5l3R7jfrC4E92Yjwg+EqJYP3MKFA=";
  });

  cargoSha256 = "sha256-c8yazRwoGjR7tdan1d62HXamxA/pKfEuUyCTN2l6oOo=";

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
