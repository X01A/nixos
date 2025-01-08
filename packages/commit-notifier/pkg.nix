{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "db7fe8f15dab78a2525f6ed23e2dfbac3f6c5157";
    fetchSubmodules = true;
    sha256 = "sha256-bzJJchjJcFy3WjqJ3mzNRC9G/N4WCVw/F1gQ42f//bQ=";
  });

  cargoHash = "sha256-pEsJXDN+j+21RTnX/qk0ZxfFaGOzvrOVzQFXEOwnbUk=";

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
