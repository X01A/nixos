{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ab952e0825fad48999be95250de2b8116cf8bf72";
    fetchSubmodules = true;
    sha256 = "sha256-Lq3E1Obc+qzC1Skuws2ESMobbdwryH9GHuYAFYS0/kk=";
  });

  cargoHash = "sha256-fCV1/SFYI4ivlpURo/SgbhLS8gTsDuqLEI3/5zxTkoE=";

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
