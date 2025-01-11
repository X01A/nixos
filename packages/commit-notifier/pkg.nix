{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "700ef0c16189bd8363b972a7a40ef4d123c94d76";
    fetchSubmodules = true;
    sha256 = "sha256-nCmytV0earSa6pkSB9lSD2lHQ+NTQZ7EOBAUHITAN/o=";
  });

  cargoHash = "sha256-AZwX5qWNPrHh1/CLwX/SzMWNF6vz4hGamekufqTwvlk=";

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
