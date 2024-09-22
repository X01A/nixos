{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5f7b9aad572575ff4d058aa72fa4da8645937aa4";
    fetchSubmodules = true;
    sha256 = "sha256-WTFqteUCX8IvEvgoKUGNhnQeXPfTFA1Wnc9u3j4D4gQ=";
  });

  cargoSha256 = "sha256-Jk0Ci0YZ2/ALSVZUxQdvd418Ia2uLttYzQ85U1MKATw=";

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
