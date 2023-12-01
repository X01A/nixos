{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "30e38d7f992172541cb884733311e4a142241beb";
    fetchSubmodules = true;
    sha256 = "sha256-mCFJ/DUJkfBO1ICJfTkfuqd0/BrpLLwwi7Ce+xSK9Zw=";
  });

  cargoSha256 = "sha256-kVHpAyIqhARGIVHLQYcPhLYFcRfJCIaLYX4OM/Ea1nc=";

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
