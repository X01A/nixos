{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "42f90d292e7df088aaf11516d1226f7936f5c767";
    fetchSubmodules = true;
    sha256 = "sha256-rdO/Qb9+W2mDGwszILvqPvton7+u9ibjmqbs4Pq+vFE=";
  });

  cargoSha256 = "sha256-Wa35WmOlwhidHB3TCWf+CcQwvoK+E6hWjg4wIpAQZMs=";

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
