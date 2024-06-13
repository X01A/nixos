{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e7b0a0f80a9ec9f728000bf8ed21e29562e4bdc4";
    fetchSubmodules = true;
    sha256 = "sha256-iLmTX5pFsoRjd1Kgux+f4xAMogoHM69SFQpGSTSjEYc=";
  });

  cargoSha256 = "sha256-99RN3ioHwok9DIZ3EhzssDX/1s1+Jx6tR2so2SiB0w8=";

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
