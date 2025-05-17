{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-05-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "cb453676f331f52004a74b452289e15e89a1f01b";
    fetchSubmodules = true;
    sha256 = "sha256-hstLoXzZ0N2AlYDSssKDe/aVlqV//dLMyuwLK9Bm7hw=";
  });

  cargoHash = "sha256-7DSUP2E8/Sgp3hOyCyQ51EJnPQpJ2/sMtu9qjH0T1UQ=";

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
