{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5c35f3f9f18d6de011c35e55d7a7a5a5c9c6162c";
    fetchSubmodules = true;
    sha256 = "sha256-cVvgxllNQnAju2vA+dB6pq8CoKYBBmdeyUVS8CX8LiM=";
  });

  cargoSha256 = "sha256-HiLmal6EyXp5BxVffdReDdLqzmcCqBN7T7A598pmUoA=";

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
