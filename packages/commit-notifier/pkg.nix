{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "03819f4646b17ae5153fbe557c947728f6a28cad";
    fetchSubmodules = true;
    sha256 = "sha256-5DYW23V/rewam4yYUUIk61SMBPI0P1SpwoDNyBn4WQs=";
  });

  cargoSha256 = "sha256-jI72S6yMVv3Uj0EuvE6ZlCaBz2/WfzXQ9R0Ad29QYsw=";

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
