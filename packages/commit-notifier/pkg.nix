{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "2475c0efe324c91ebbdfc324742b1ee02fa007bd";
    fetchSubmodules = true;
    sha256 = "sha256-YFLqClSt5QsY0aywkTUwqCfBelXy2Q+PGScT/HDytbI=";
  });

  cargoHash = "sha256-/UIeqH0abP705NEcVVb+vQOf2Tc5ydmPSE9DFqrfNrw=";

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
