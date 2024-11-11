{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "515b98be706f574a3426c5ebedfa99b81897af39";
    fetchSubmodules = true;
    sha256 = "sha256-01Ld4tp4ix/UVuHNiw/gyiPHBi1a0z4kKFcUo6lEt5M=";
  });

  cargoHash = "sha256-QatwH6F2TEi+wseaYSM8si6DTdPdc+Xy2QIKKCLeGe8=";

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
