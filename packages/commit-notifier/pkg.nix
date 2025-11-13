{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-11-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ae576714c4fb54e1c101a2d5b1ef3f78b37710d0";
    fetchSubmodules = true;
    sha256 = "sha256-bfAibtLgp+DZInxUiYaMxaB08mCrUXAHuv4HYMaD+qE=";
  });

  cargoHash = "sha256-TVTjBqK7NZu//qmELhL2yF8wKlEXVAiF4PsakWff87E=";

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
