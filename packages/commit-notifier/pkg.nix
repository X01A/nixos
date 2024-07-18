{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f75269f95fba89262a5f9a205d0d1244500da182";
    fetchSubmodules = true;
    sha256 = "sha256-4j7sx03TbybaXCOFcCob61p2MptN0LfZkQXEM1StXAs=";
  });

  cargoSha256 = "sha256-R/mU3zcC8evU6EAdhMsrLHruxfIxZqIn+6lm5ekZWr0=";

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
