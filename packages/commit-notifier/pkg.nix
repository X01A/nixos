{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "49b5eddabd2e133783b27b92a40c2c5e77e16aad";
    fetchSubmodules = true;
    sha256 = "sha256-knBDty6YeAceWIjJT8WIxFpz7oTq/sOscIAVHjjUBEw=";
  });

  cargoSha256 = "sha256-MqNHGlPUhg0/AFtSOJ+dbY3ggFUQMkpj9HpQpOeWxXE=";

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
