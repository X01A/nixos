{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "30c40e29575b9f7d9fee93b556c92f28078b9401";
    fetchSubmodules = true;
    sha256 = "sha256-ELQkOO+b8lsHygmxey7HoguPSseK59sPv1onqOMpmSE=";
  });

  cargoHash = "sha256-WkckqbwRY76qQtImR4lPIEpJbf8l//NxDomrcTz/cAY=";

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
