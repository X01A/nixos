{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "67990e83b5fa35effe296c07906f429a5eb6e697";
    fetchSubmodules = true;
    sha256 = "sha256-im75NbsAvQXSS9oX83sG6Q71sti+8unDU7kSF41EQic=";
  });

  cargoSha256 = "sha256-CijwiK0oqvw4hyMW4qvm7hPta9e9dGOCi/gkWJn+5tM=";

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
