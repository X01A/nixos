{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9e4eec286665dc3cdccd4d78f0cb8020ca04aacb";
    fetchSubmodules = true;
    sha256 = "sha256-bwt15djc0fm9W5YbDfniZdbwAjS8l/HvQU5tezymyzU=";
  });

  cargoHash = "sha256-N4svxlWnXUqKivOkHxCg4Vj24oZjk2S1vwi9Im2euMs=";

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
