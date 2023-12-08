{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e41feaa6c9fbc469175fc26decbf10c84a3d4d69";
    fetchSubmodules = true;
    sha256 = "sha256-aLGj9Os/kSfZAACqzIqwbwQPkT5l87xxvdyTfkghVSc=";
  });

  cargoSha256 = "sha256-Wp7ssl6pM04t1XR9VpZAh3s7L5GonqCqq2kBDYpiWyE=";

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
