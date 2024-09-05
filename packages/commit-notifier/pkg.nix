{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "7d4c5883985a3df43fcb58ce72bb10d76e2c2799";
    fetchSubmodules = true;
    sha256 = "sha256-Wwko4dOVZUWucwjxfEa6VNCdAIrn7wll6ZYZrp1h6Fg=";
  });

  cargoSha256 = "sha256-Z+ctD+JZIo7WSQwILzffwjdJu9nIzOCpDJH65G0xd68=";

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
