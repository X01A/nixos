{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c77963e15b5e7533aafcbd4cae5a38704eecae10";
    fetchSubmodules = true;
    sha256 = "sha256-NBxZkv1zhDLPnLi8yz1D64Ljp2tbePZ6yYp1tINleS8=";
  });

  cargoSha256 = "sha256-9sTnFLWO6KKkMdr4/OaEyiESOyoxYJ/JCY1YWxXRbU8=";

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
