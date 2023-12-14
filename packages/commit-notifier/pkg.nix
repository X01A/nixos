{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a89dbfc2b0c660aad3bda8dca98cbf61cf7d6532";
    fetchSubmodules = true;
    sha256 = "sha256-x3fNdH1equhacasFwD8P5cnYsL7QY/ME1iXx2htPz24=";
  });

  cargoSha256 = "sha256-Sma935YIXC0PrxympsP2UwSm/Fiao9cPur1F1uqRaXw=";

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
