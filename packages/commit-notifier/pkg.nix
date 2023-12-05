{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "bec97a589c88543e55159d13c5daed1b95c9c748";
    fetchSubmodules = true;
    sha256 = "sha256-/Octb+4N23pZ7XWPBGh8vmJWR2jj9SjFrHSIpnuQaRM=";
  });

  cargoSha256 = "sha256-8/B1u/SRyTJOnF7v7NmcwpySsOJb+y2riSfQ9RLqE9k=";

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
