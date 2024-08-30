{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "728176e2a1b06d8a4710f5f2b204b9aa18ba8171";
    fetchSubmodules = true;
    sha256 = "sha256-CkGuuhuLVyNlIBuA+cxowUA6j4JOED9clY3x0knjOpY=";
  });

  cargoSha256 = "sha256-4Mf1A5Fvd5Ke/zHezVKciSDTfoWy8bVGmqAiIikmn6o=";

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
