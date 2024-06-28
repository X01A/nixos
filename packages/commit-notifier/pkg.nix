{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a4ea06b3898f72323a303862edef0d420f1681e2";
    fetchSubmodules = true;
    sha256 = "sha256-mGMGiKzYHb7wa/ay/PZ4dTE6b/t8SAXA4M6+jP1ehSc=";
  });

  cargoSha256 = "sha256-Q7SKwhRO3q6ZSaUKOQWwzgMYGy8hk2uVRP4owKqlsUk=";

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
