{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-05-31";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "be8cb51bf4817f3b496760d2869e9ce79bdd344e";
    fetchSubmodules = true;
    sha256 = "sha256-s4KYGVxxvpERmQjjtL+zWg5yAjr1VIhdwsCXkd1WtdI=";
  });

  cargoHash = "sha256-888t71DEEwjXMo2gt+Yov16x+H4JWlmrLjdXNlpzfAI=";

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
