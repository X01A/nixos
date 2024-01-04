{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6c6be186f28523f57a96c93b42be57f494a700ae";
    fetchSubmodules = true;
    sha256 = "sha256-YGclaLswjNJM1LJS8XT9T4PpfWCnGSR+QWPWUaHNCoI=";
  });

  cargoSha256 = "sha256-u1LJqtvVd8FaVkn5FaqBrVRAtodu4HLFxs39VA4KzKM=";

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
