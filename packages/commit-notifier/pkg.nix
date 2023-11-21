{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6d7a81a6db60cfcbbb865f06a9b1b93f63546cbb";
    fetchSubmodules = true;
    sha256 = "sha256-z+rFjifXKCGNcvQ9qSUmDEJ+pl9nIfmKFmoBZAqqjKM=";
  });

  cargoSha256 = "sha256-UUtPJSdF+1jOXcuVaZnSeF2DIqftLdfbeq0tsaYM6/U=";

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
