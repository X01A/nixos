{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-09";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c2d1d4070da31ccfe5bf2f1a8cea3d38b58c10eb";
    fetchSubmodules = true;
    sha256 = "sha256-nqZ0IHiMvj0jZIUB6FxvbEO7y3npj08wAEjwahgIO6M=";
  });

  cargoSha256 = "sha256-iVoWqWmi1rcUCr9mnRTwsWvayelhAwWlx8FLasesuLs=";

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
