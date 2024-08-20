{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d475177a109b497507ee1e88babc91adb3841f87";
    fetchSubmodules = true;
    sha256 = "sha256-r4dmCZQCOxXxobS6PJ9RgsUvYi7GPygETtTFKxCxAak=";
  });

  cargoSha256 = "sha256-FkYI6koE2sNkiaAoiDmu8ZEQfHphS0/SyS0ydhp1uZI=";

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
