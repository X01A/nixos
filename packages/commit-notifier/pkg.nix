{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "68f49636ece9e2d38f4f3faed56235257c33e10a";
    fetchSubmodules = true;
    sha256 = "sha256-Av7bINUuA1IeqrJ6HjvFHE9Hf2eEgm+NXRePDN5Eta0=";
  });

  cargoSha256 = "sha256-ZHRm9RVIOlH4mJl1Axmbc6Ls9vVot/wTDLzJyX1Ab8A=";

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
