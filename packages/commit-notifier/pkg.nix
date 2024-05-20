{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "640d11dd9eb5be45d5b4d6cebc2aa11ef91a5434";
    fetchSubmodules = true;
    sha256 = "sha256-rBsGIkeF28eznkwK+QyTp1XWVwggBJdqK0Aibd8b7HQ=";
  });

  cargoSha256 = "sha256-0HUB0aqHWQdBEtghUsRfoyA2jSttbeVw2SxhaYpWwXo=";

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
