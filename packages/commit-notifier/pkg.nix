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
  version = "0-unstable-2026-03-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5439a6f6cff3787dc5a9fbb6baf03f9c442e195f";
    fetchSubmodules = true;
    sha256 = "sha256-AJPPQY+KiyKUn5SlYP7cia/OBnBkQ8QwrfY3URtDo/U=";
  });

  cargoHash = "sha256-rT8ftSu+REQTyfyTgSJyleTL5An9P/G2oShkDkddMws=";

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
