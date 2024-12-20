{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ccd980b6fb6cf3ff8d7f1554808a8ebd89734dfe";
    fetchSubmodules = true;
    sha256 = "sha256-6G2nTdBULtuxHnJH/N6pT363TMcMOmGKocveZEoE3BE=";
  });

  cargoHash = "sha256-vzp54uo7qSDQdacK+w8jBJh5wYD++dEZZnW3oNVx6zg=";

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
