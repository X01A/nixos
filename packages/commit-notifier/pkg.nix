{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "b1ae13788b6c8aadbeb5e2ddddcb6975115a3cc3";
    fetchSubmodules = true;
    sha256 = "sha256-x3CK2tx1lq11XUfd3V1N/3gRHjJFtbf+QKPCb9UoZhM=";
  });

  cargoSha256 = "sha256-t0WiALWhARp9Bx+yj6PX2Ep3JD+hDpZ1y7hAp9A4KvU=";

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
