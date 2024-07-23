{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "bf0c18c5a18db9696e4e065aa5e455aab9668a2d";
    fetchSubmodules = true;
    sha256 = "sha256-DjoR9DsHau4qe6aUdIwJ6jxVB7AuarpZ2rzuw5nQpKs=";
  });

  cargoSha256 = "sha256-psLnStbqXAMZ5J+SvsGkuN0z4mo4l4mrzfxzydWfCQY=";

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
