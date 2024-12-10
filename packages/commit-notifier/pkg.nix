{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-09";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e44da292f8a6849c2b2b635ba33c508737927eeb";
    fetchSubmodules = true;
    sha256 = "sha256-wbDNETn1qXv0w+namwestmh6d+t7WGtM2j3YwCNp2FI=";
  });

  cargoHash = "sha256-apZzotLYsToijoPi+qOTlqemVF4C0v+2YKbXSlcyAYI=";

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
