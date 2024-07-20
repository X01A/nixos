{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "704e4612cb8779d833e1fb5956a5edc2ed760a5c";
    fetchSubmodules = true;
    sha256 = "sha256-tDGF8p3FpkfzyelwsrLAYcPzEb7TmmKVAsAYt2HVmFU=";
  });

  cargoSha256 = "sha256-DuMzFpzeE+sHoZxf13h3WygVilji/tZBj2VyWaeT3XI=";

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
