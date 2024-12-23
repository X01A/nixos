{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "b002f0260ca5d975075e02c54b7f21d3cafbbdf9";
    fetchSubmodules = true;
    sha256 = "sha256-PIlO4KF/tI0anglNAtUKjUHswhVEk+4BEXSO17+b9LI=";
  });

  cargoHash = "sha256-BUweoGJjbEA7cIR6EPG4D0c8QY9iE81qNa8tfjJ38zo=";

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
