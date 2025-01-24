{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4b24da7ac348f22ab0fc0a161a15b06efe3c3737";
    fetchSubmodules = true;
    sha256 = "sha256-VONrSB2gUUKdSqjNhRL5yZwesF2uzzkLjwoyv97wdCI=";
  });

  cargoHash = "sha256-oyviicGKjcPb5tOJyYV7KcJEsYW1Tt/uoUBWjShMXLg=";

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
