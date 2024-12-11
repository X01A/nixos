{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f453fd5768fac94131d41ce23716cc6bcadb2377";
    fetchSubmodules = true;
    sha256 = "sha256-BuMMIMGPkAu0xOfhicqkwojQf7ssk42kf9tMMK+oMP0=";
  });

  cargoHash = "sha256-IaCkV8umxt/lJ+lcE8TkLrY29uIUSx00faQwk7hMBwU=";

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
