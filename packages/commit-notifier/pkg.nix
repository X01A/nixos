{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1c419499998bbc9a90759dc9493f30525e8eae1b";
    fetchSubmodules = true;
    sha256 = "sha256-7MGvJav2bspHgu8GCOfF+ZOPh/KxnVpeKhZI/74gkPM=";
  });

  cargoHash = "sha256-OpAmBHrqEzbY19/5rkWZpt5tVRzu3Qy0I6gGYHb14hE=";

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
