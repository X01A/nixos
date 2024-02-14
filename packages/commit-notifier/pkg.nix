{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1d6c419a68f48151cf63ef52e03ed6413c83e153";
    fetchSubmodules = true;
    sha256 = "sha256-vFMMKjQ+il5LvvaIh6gjAWD/W2E1sNNaB6/8ogYlc9k=";
  });

  cargoSha256 = "sha256-vMVsikqBDjE1Uzy3YuESlNACqEdowJDdiFHxhZRLUBQ=";

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
