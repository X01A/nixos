{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-04-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5876ba16112b67962139215ff7ab7bbe26c8c786";
    fetchSubmodules = true;
    sha256 = "sha256-lTUQY0NDqmEOqPeVYhc+lDV0EU+qQ22hbu0+Ip4Jn44=";
  });

  cargoHash = "sha256-K/kZTw7zzy1Yelq1B6c7xu5ZRE1xgVpkP5h4gc9bst0=";

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
