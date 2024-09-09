{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "dd17d51d107d87d6abac38e60efa066f8cbe826d";
    fetchSubmodules = true;
    sha256 = "sha256-cpPw0igkohmzGXwBxBRE3FsfK0k42eGgbwSZXABmxS4=";
  });

  cargoSha256 = "sha256-oMA0BHUvfLZ7xrsco9LA8cXT+3fDmNwfjP11bbuu1pA=";

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
