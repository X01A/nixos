{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "3852e37f68c0f3734e9700e70b2e9c63b7fca65c";
    fetchSubmodules = true;
    sha256 = "sha256-YPVqk1d40/wtuB4Og50hy83YbkHh+dvhvDHcuo2LUyA=";
  });

  cargoSha256 = "sha256-0K+BzYxqgadyW5M9QCReQkrajVTeKm8z+9cinAR16E4=";

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
