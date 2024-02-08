{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "62912136f545bf7eba5823eccd0c61fecc63f25c";
    fetchSubmodules = true;
    sha256 = "sha256-UtPEaIsaKFtP+Ma/RpmxbhCBZfCzDIuFf47P6e87cLA=";
  });

  cargoSha256 = "sha256-rilVDO1us7qEuzhHtRtuOrYWDc1tIpuGQ/8PxLC6hLU=";

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
