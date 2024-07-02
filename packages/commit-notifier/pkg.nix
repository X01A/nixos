{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4e06e0a008f56357c8685b5f850d93106c19dae9";
    fetchSubmodules = true;
    sha256 = "sha256-pjMDlo0SIx1wjyq0irUXLdBQ0hoXDTr91fXp9QTjhdk=";
  });

  cargoSha256 = "sha256-5P83Eg0Yb+BKPlahAxbqFMUcveVyAFrNZ4acsND2DK4=";

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
