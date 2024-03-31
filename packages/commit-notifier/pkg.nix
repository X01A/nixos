{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-03-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a375fbb3a847b126098eead6bf602f9b5b8842f2";
    fetchSubmodules = true;
    sha256 = "sha256-QnwDz4STHx/btQFj0+FEUrU+lrROxaDtRbmTBffCy0o=";
  });

  cargoSha256 = "sha256-Efe05TeQllI8IvsJqavvzcwhPkfyi/T5N2PWSAOPR+8=";

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
