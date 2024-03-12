{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "954279797cde1d6f25eaba2d7c87f227eedc242b";
    fetchSubmodules = true;
    sha256 = "sha256-quZYP0FGYvjLrZQCql3rrtrDHfa88eVc+dCc4VRJDPw=";
  });

  cargoSha256 = "sha256-FAM5N5n5m0n6jQOuCimwldDT9nOIfLgs+0Z8gDchMXw=";

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
