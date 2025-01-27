{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "59b6705d199ab4dee58bb6913793fa7b1b25b861";
    fetchSubmodules = true;
    sha256 = "sha256-cci4TMA7ujWyvIjmDrgRuG4FYVg++uFedO097lYl78M=";
  });

  cargoHash = "sha256-aSzKCGDq3SupSnbbhnIR6ukeZTvrQfC/VbhPUBV4NFU=";

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
