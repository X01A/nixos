{
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  zlib,
  libgit2,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2026-04-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "418dd4a11032024b1807a56c53c5663dc9f251b1";
    fetchSubmodules = true;
    sha256 = "sha256-Rvcyj0q5mKrRUu4Yk/4hzN6wvNK+eMExNqtvQ+xek2E=";
  });

  cargoHash = "sha256-7DGxeRd10rvF/NUytyLVx8+2YarhfEBOSLbmZRudMtw=";

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
