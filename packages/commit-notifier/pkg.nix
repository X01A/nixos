{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c911e98e777b3f438b0e1cdcdf645da2a36b004a";
    fetchSubmodules = true;
    sha256 = "sha256-43tsBvCRPXcTGXjJp7sF+ub+eyzcQAtAtn0nSXN+m8E=";
  });

  cargoSha256 = "sha256-/3PbcDoaos0zQQzXyvcDXGbJqDhnUl4DwQu/R3Zg/yc=";

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
