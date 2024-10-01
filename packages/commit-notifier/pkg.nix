{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ed1710a209c1a7bf21fe323b61ac9a919027721f";
    fetchSubmodules = true;
    sha256 = "sha256-TwYKQURV1DDFftbNPNVAFFfD3IFs2yCoejOsIpLqCZA=";
  });

  cargoSha256 = "sha256-t1cek5gZM5qm/6RpBlDG4lYuNmmYMgJGt9C1r68VHc0=";

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
