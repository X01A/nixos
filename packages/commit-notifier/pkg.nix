{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "94cfa97bdb1159d1414d4e547159d09ffe5a8780";
    fetchSubmodules = true;
    sha256 = "sha256-HTR3L717i1MDiVHGdvP/H4Zw1gc8qR/alGJGeiQkm2w=";
  });

  cargoSha256 = "sha256-Hq68Q0Pfz/dtMEHyq9LX/SzHJXhe1mX0ovjiIs9SKmw=";

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
