{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-03";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "10bf474da899026e05b887593e34b24fbd3a0aef";
    fetchSubmodules = true;
    sha256 = "sha256-I7IJdMrph2EAQShtS16c50arZrMyvw//WDU36z2CPxo=";
  });

  cargoSha256 = "sha256-5vKe1Sg/rRAFKDN8qVJGCWTT3/ilbt4RzL3+NhIslZo=";

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
