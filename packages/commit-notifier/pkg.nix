{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "3b0ec85901187386740b5328a8ce37a402f1e907";
    fetchSubmodules = true;
    sha256 = "sha256-omnDy4nsWyJzSbiWwX/BZAOonm1CmWIF+qzPGI6LBas=";
  });

  cargoHash = "sha256-QlIL8gLq5914t6ouP/fTCtXV7MhyrvMo8roaJfww9mo=";

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
