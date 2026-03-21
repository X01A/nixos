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
  version = "0-unstable-2026-03-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e7e68e76e6b71540f07c6a770dd2e6859e12186d";
    fetchSubmodules = true;
    sha256 = "sha256-CL8JlifVuUpmH1i9ig9ZnXk9fRFOqDJTWESGpkL1BKo=";
  });

  cargoHash = "sha256-99IaHGesc4Q9O4wPWxlatJqk7BS4OuAa/+SgXmFxSRM=";

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
