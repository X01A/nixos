{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-25";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4257c9d5f107879de278aa626594ed853c42156a";
    fetchSubmodules = true;
    sha256 = "sha256-L+SU1Y4jL1J4Yvfw4N49Vogh3b2JWKenuqtNFzlTpIQ=";
  });

  cargoSha256 = "sha256-vrfOQg6Sa+9aDwUxylEPZz3h1iXnEmoSL3km/1uB1BI=";

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
