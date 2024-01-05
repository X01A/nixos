{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "608c3ad72ad3fe36a483bdce0c00d64513e99b2c";
    fetchSubmodules = true;
    sha256 = "sha256-bAXOSDIIYsGpi7gYfa7GW42Z6XefhNk4oThENm7IBd0=";
  });

  cargoSha256 = "sha256-YzakHYIsxDkl/RUG3lvxO6Yq+FBcn/rfWp/E4dP1Tck=";

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
