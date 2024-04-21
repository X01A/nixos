{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "23423d2746f5ce6f2b057e44a730dd18529c0912";
    fetchSubmodules = true;
    sha256 = "sha256-LgHlwO6wP57pV1plbV5xlPlaIrB3jz3DGDeV25wbGPg=";
  });

  cargoSha256 = "sha256-AfvCeeGgxnvDS32rmwPvyjSnMwJNFH8umvrf+LVh3uc=";

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
