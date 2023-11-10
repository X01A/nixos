{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "de9f086e40734692ff4808c6ed9551a6e5141074";
    fetchSubmodules = true;
    sha256 = "sha256-zqNfmVs+VHhslJ6Ix/PbrRhVotys7L2A7e1kUGTTR8o=";
  });

  cargoSha256 = "sha256-wOJvBgCnkARpBI5S4Omo345df4c5c2LAXK9O9E8uZ5o=";

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
