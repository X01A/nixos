{
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  zlib,
  libgit2,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2026-10-31";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8a74e7bd73c7056595c29f405342cc5f831f204e";
    fetchSubmodules = true;
    sha256 = "sha256-4LTIRBFVYhVsQtB6UyN0z8rSqWhAlSs+CKFsH8MA1wk=";
  });

  cargoHash = "sha256-IwS64X22NAw3tbhLo6op61k+fsMAoKSBi2ld+4c+Xlo=";

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
