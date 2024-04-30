{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "55f062a2bd3b945625b7cc3ce41c5ba4d013f9cd";
    fetchSubmodules = true;
    sha256 = "sha256-QwwqiaSCyTiZOfpTBZaOd/SBPx5z3zSn5fD6l8lTYlI=";
  });

  cargoSha256 = "sha256-Q4rbc73H7EJT/GDt6SP8iiPMToEupRZPguFEUkugMns=";

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
