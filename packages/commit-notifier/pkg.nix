{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "88f009534a35847dbb2ad6b84fb86db88d964e25";
    fetchSubmodules = true;
    sha256 = "sha256-HKCu9e5I90W8xEW8GvlRLoKBstOhw478CTfb/nhcClg=";
  });

  cargoHash = "sha256-qyFKoGp+jhvbfGqc353MTXo7dcbU6oer3iPuQFPNyIk=";

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
