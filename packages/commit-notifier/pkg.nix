{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "925e7da8b4177e731dc9ae4584e0eb9ce0834be7";
    fetchSubmodules = true;
    sha256 = "sha256-A+9QqvEqjK2uC44IMvsKSNwC1TWUdpU4e8xgSy4M6tE=";
  });

  cargoHash = "sha256-dQ2/HWVdyhCIMPqeU4YbtpDRFXSELyGtC/Mht5U51fo=";

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
