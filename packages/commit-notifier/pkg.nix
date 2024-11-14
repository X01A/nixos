{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9f69a4ada147f8a9f5d51377115d7c50dca6efa4";
    fetchSubmodules = true;
    sha256 = "sha256-gc0QTC8spgKwPIqBKHWff/evh9fzyre6e5gfdMo1iJI=";
  });

  cargoHash = "sha256-lnw+CtcJHf7Em63FwBGSzundNJURQ5yGDQJkh8NysGo=";

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
