{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6a8b656ccafb326f087cc5d26c2016f8a763315b";
    fetchSubmodules = true;
    sha256 = "sha256-R4IrtCWvIkRixivv2iV3CQ6HNiYm3Ez+J+jzW2YKbJA=";
  });

  cargoSha256 = "sha256-ZHRm9RVIOlH4mJl1Axmbc6Ls9vVot/wTDLzJyX1Ab8A=";

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
