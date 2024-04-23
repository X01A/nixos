{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a914d4bcc63bede62846dc3c63c3fe284fb7fc39";
    fetchSubmodules = true;
    sha256 = "sha256-b4IWpB/paK9Gf6SRdzsLUxLWjoJ/BKGt+XK+hV10I+8=";
  });

  cargoSha256 = "sha256-2SKtBGau7XCnV3s+jwFPASabop8QU3rYFU6nocQlM4I=";

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
