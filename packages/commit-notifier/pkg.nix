{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f9e902af2eb1ce5120b56f888d6dafefe999829b";
    fetchSubmodules = true;
    sha256 = "sha256-xJKa/Ie9TQQFDyM7BkC+Udkt+uOsOl7W7o10kGc0FJc=";
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
