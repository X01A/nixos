{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "94239316e4e45f701015a2ef8b371008a4a757d7";
    fetchSubmodules = true;
    sha256 = "sha256-eNQt6cES74BBgvWp1CrKQhfhXZYk4b4YdgYcCcQVbTU=";
  });

  cargoSha256 = "sha256-NILGM41a8e/ZKFjMEO3Gb++sbXnQOAYUO68EkyTSLjc=";

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
