{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-03-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "954d5d4ae3d0e5c1c36fd597e88cce90fcb22354";
    fetchSubmodules = true;
    sha256 = "sha256-ygZMz4r/VWP0PUXWF6xbgvb69FXtIh2NPYW9MioghpE=";
  });

  cargoSha256 = "sha256-WAkTKfsUd40s2v2vha32Ni6N2+/0eEWn7y9EBaQmmmU=";

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
