{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-28";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f41682f8bab4bd02dc432d12f1676c39b5ef3974";
    fetchSubmodules = true;
    sha256 = "sha256-C2xZuqrDKsbK6KD79fABXUAbsZ5nTZV5diYKy8zCJzk=";
  });

  cargoSha256 = "sha256-szuor8HB+JJeqN0/8xJn7Fxjr5Tv7cdnBfsFgYZNka0=";

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
