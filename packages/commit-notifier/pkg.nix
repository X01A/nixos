{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-03";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c912ccd5069f5de09b9d19fd98c327a43f5dc69e";
    fetchSubmodules = true;
    sha256 = "sha256-q+SKrMZFZhSq7xXqAQu8QW3KhvO5rPjJHpY+jQR+IHg=";
  });

  cargoSha256 = "sha256-9APUKTNCwgIADYC/tRt6lVur07BPko7u7PzxkR2RVPY=";

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
