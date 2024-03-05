{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6d373718c0e663a63a7edfa402ae9e8a30eb9a9a";
    fetchSubmodules = true;
    sha256 = "sha256-FGK9gYYhutW4PK/VXENP6/XAGR2m//W6u1+ITNK+2+0=";
  });

  cargoSha256 = "sha256-6N3SYfq5zEV0WzVeoflIXVXSAhki9/5h5dh/baKa6ks=";

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
