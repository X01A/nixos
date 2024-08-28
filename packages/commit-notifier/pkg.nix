{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "cfcc493ae1ef5c2b1c6cdc411ba00d5ac79725e2";
    fetchSubmodules = true;
    sha256 = "sha256-cg9g/tTIklRLmHyVH+hbyhtxHVbmiT7bnjrR3PpeHsA=";
  });

  cargoSha256 = "sha256-c1tY6efP8ZnqnAV/Njc+bW8YsreoBgd481y7kRNkzGQ=";

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
