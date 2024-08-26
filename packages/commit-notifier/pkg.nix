{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-25";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "07d53ca2cf4c0875898239c0ef470c0befd79c3a";
    fetchSubmodules = true;
    sha256 = "sha256-GZFSzpkJakS9MoBi3H9S0E3Y9rJh8Y3nbs49iJpxI0g=";
  });

  cargoSha256 = "sha256-V1lalvFVcp7S+MDOxSNgOqaO2dt9seTIwTduq+zHBgQ=";

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
