{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "3c02b57ce3ecbdbc096225309022ecca8a5127e5";
    fetchSubmodules = true;
    sha256 = "sha256-MPeKZ/I7eZRJDVuWZnO6cnX0LKBl9gWARCcCjIpZVq0=";
  });

  cargoSha256 = "sha256-XZE4uc+uKIWCO+bQu2PUEFD3M3dCCFE0iMGJeL66ZCc=";

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
