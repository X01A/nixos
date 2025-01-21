{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "410c18b8c9712c712b37150ef4574184018932a8";
    fetchSubmodules = true;
    sha256 = "sha256-uuSTx+pVszDr1Ar+fS3iBKbJeD++ZDfdrM1mcaj94G4=";
  });

  cargoHash = "sha256-GpKZ75nFiTwMZIVWny0jlIQwfmT9e7x5AjZU8EgRbik=";

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
