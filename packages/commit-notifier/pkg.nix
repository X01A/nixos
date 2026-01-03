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
  version = "0-unstable-2026-01-03";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "21c6617645d1bdb0ce213f14053665e3474756bd";
    fetchSubmodules = true;
    sha256 = "sha256-iKdqHMI+TJNbxxmFC/SP6DMCh1EiTWAnrXJ0Q6iSK6g=";
  });

  cargoHash = "sha256-OTXNRVEHT8cor76mNTbstb0GZBPal9qlie1wz2W5gpA=";

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
