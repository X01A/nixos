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
  version = "0-unstable-2026-10-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e4265a0bbcc5e6eee89861116f94fc749e240fe5";
    fetchSubmodules = true;
    sha256 = "sha256-fP92FVQNf5maTfbgSzmaDoHaz5eyFAhIfPG/Eo9hZ0A=";
  });

  cargoHash = "sha256-oi3iQTGtYUnknqtCEDV1+lir7crz8s2VImElctvrgOk=";

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
