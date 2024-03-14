{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8ade9ece7224ce363a1db7fcd426bc144ac16804";
    fetchSubmodules = true;
    sha256 = "sha256-6csqHIj5TGpNxhO/422Q/C3i6fhz162wugtz/3V3fPY=";
  });

  cargoSha256 = "sha256-7jyHiDGVrNlYmA2QjZSM0LQLBUU9eTm5jQVk5mRvhOg=";

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
