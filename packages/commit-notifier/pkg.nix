{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "109421497ee0c4468a01f46969a78d2cc14209a8";
    fetchSubmodules = true;
    sha256 = "sha256-QDxr/MxgqrQM9xefaRy/lWBv1CypFze6EysZ9fRq3P8=";
  });

  cargoSha256 = "sha256-58g0kqq+80S2XANT3I0y1F5z83xZpz7U5IN9IyHqajw=";

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
