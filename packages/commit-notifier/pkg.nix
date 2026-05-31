{
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  zlib,
  libgit2,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2026-05-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8b5606baeff5e582b07252b2ed988351b0ad18c0";
    fetchSubmodules = true;
    sha256 = "sha256-IDOAvHoIe6a/LakvZ6xfIExxyGOMsVIjMeZ3elx3N0I=";
  });

  cargoHash = "sha256-iLCRLo0ZlMEJV/rA8EU38Dwnt14oiwqkeSufZpOaasA=";

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
