{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-31";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "50be18d356688e7227df8ded2f64366fabda0ea8";
    fetchSubmodules = true;
    sha256 = "sha256-OA/mai74MCBvw7CgqpjhwfMhMaCIZJRgumB4nwX51k8=";
  });

  cargoSha256 = "sha256-2nCbpZuS0vmHDvF+rVe+3jpc1LWEMl/xw0GyMSsuH7c=";

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
