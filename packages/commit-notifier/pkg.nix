{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6d51fd2e1f49de11a72d70be6ea1b58298df60a0";
    fetchSubmodules = true;
    sha256 = "sha256-bZc+zvcFVlMZgNbsRq5ITp12LJpPVcQvcpOOoPY3ul4=";
  });

  cargoSha256 = "sha256-c6AKIJVA7nsOsf5K/mFVjVR43WETeTYUmK4WBUuFIV0=";

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
