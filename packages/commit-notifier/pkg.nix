{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "07f647a5a5432986db0bd09e331719499eafe19b";
    fetchSubmodules = true;
    sha256 = "sha256-bxEGoSEj4eajeWUZj8rJ2XGRxh2mUzOLzXvDtHQMypo=";
  });

  cargoSha256 = "sha256-Z+kaBnqUpfUzSC5AmPEMLNyLIoDZkzMFkt9qBaKUSgA=";

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
