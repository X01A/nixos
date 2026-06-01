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
  version = "0-unstable-2026-05-31";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "82d9177bc494f946d5fcdae14578908b5b7fb2f5";
    fetchSubmodules = true;
    sha256 = "sha256-tlYXx9gtHv3HSlmdtGIZ70CsL19nmhoi8DbzQu30izQ=";
  });

  cargoHash = "sha256-VOemLMuCa1AEwbFnngimO9xtpi/ZGcX6ZstwKEaOdvA=";

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
