{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "dc0812483844784dfbb0bba45b2531d301f896f2";
    fetchSubmodules = true;
    sha256 = "sha256-EVTLewifIXTNtKJAVMb1+p5xe97G8Az8t2+mmYB/2qI=";
  });

  cargoSha256 = "sha256-ru0++7JjuBB92yn6I13L3Rc020nP2qnlq2Lp3nIAFlY=";

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
