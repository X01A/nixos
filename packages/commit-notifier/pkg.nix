{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c0d76558e96b2bba3eb9d4933a8fc92a2f18257b";
    fetchSubmodules = true;
    sha256 = "sha256-wEaVI4yqGKzb5rtQ3Tp+zZvKmVBmlMjm6tzQDlVbsIQ=";
  });

  cargoHash = "sha256-bp9Q50pWBod07zhVrp40c4LJ5y+V5dnf1S/HOjrdm50=";

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
