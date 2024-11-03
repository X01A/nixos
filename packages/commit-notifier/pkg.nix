{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "0e307369efaec483405cccfcc17302c762022dfa";
    fetchSubmodules = true;
    sha256 = "sha256-zSSm++m8QvIb2xkENcoXCpW17KSGe/NdlYzkwLz4eus=";
  });

  cargoHash = "sha256-QDebvj74p0S9E7AoamNmlEJ7p5XawcH+F+/qJuyFwH8=";

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
