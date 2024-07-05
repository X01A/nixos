{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "10914be7817c3dc9d1b68d7027aadd858f1db01b";
    fetchSubmodules = true;
    sha256 = "sha256-yxQ7E5kqFdJ5CONv8TKP87HsVvkN/ZHSD/VVxobVSW4=";
  });

  cargoSha256 = "sha256-0WQJlqwZP1rJkkv7cxDKF0UhVvd4dkeQPctOySOs1A4=";

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
