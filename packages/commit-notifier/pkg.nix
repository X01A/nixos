{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-03-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ca79f14abbd4318c9f791299af2734487b1b2c92";
    fetchSubmodules = true;
    sha256 = "sha256-nRkHphSjr0Ar07BVLq0d6r4dy/Ib4EQlO0fc7jHVzKc=";
  });

  cargoHash = "sha256-D7o3F2nYVBSuVVDHLQ2OWjohzFehoEfl/cDzwx26Q3c=";

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
