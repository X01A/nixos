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
  version = "0-unstable-2026-02-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "b28ec94972a4b276f6c5c1ddee8403848127fd93";
    fetchSubmodules = true;
    sha256 = "sha256-n9j9Kc28ucynbYrYGt7bnMj1ituAmYkMygPHC47cNrA=";
  });

  cargoHash = "sha256-pvhLVfmFwzq85qt8RyAAV7m4HmTNW9DS2o5VxO820GE=";

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
