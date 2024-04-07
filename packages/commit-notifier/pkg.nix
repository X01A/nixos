{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "0db46a8ff2810d64ae068a5320894311490d7418";
    fetchSubmodules = true;
    sha256 = "sha256-q1RuT1lylje2vSiWqE5u51hclouOitQ8qVAoHEDMlOI=";
  });

  cargoSha256 = "sha256-BjK9Oxfo6mpVeplWWERsbzEXO2IR6rMFMQ9UaEssNc0=";

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
