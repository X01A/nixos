{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "be01b2402182a89d29474af7cfeadcc665a08773";
    fetchSubmodules = true;
    sha256 = "sha256-dBXEzvxjMUvA48XIXoK7I6x8hh0RxXlfjtJ63DRGG18=";
  });

  cargoSha256 = "sha256-gEH2V220FTwawA2l8hOin0M0lDDJM0RMqHddEuFJidQ=";

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
