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
  version = "0-unstable-2026-11-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "dc68f346306be2745694464180bcf8886706a4d1";
    fetchSubmodules = true;
    sha256 = "sha256-ZX087g91sk/1hVgE9O9tSzeinXtti3v17KUcmErf4L4=";
  });

  cargoHash = "sha256-x2qnpccXcDbKeAGwmxf9LkHT5ENRdlJD8eEw/gkB6Ng=";

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
