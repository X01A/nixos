{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-11-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "527e2b51a2c30316ae8ceaf1fb15d5e2f01b3e6d";
    fetchSubmodules = true;
    sha256 = "sha256-ihpPNPX1kJnjznosWQiE1bbnAqDcvqz6XublnxvbAPE=";
  });

  cargoHash = "sha256-TFapkaXYEVnEgsy1dm0KaNdTUXSLIlbmFRdvEpFYfg4=";

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
