{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-03-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a7cbce9645a07b1a03a985e93087486943717970";
    fetchSubmodules = true;
    sha256 = "sha256-FaAyXN5wga4UIjVwmwUZ280TIJ0Ira+AnBgOkrE6OYs=";
  });

  cargoSha256 = "sha256-4FCvaT1Kyi0qVdKlJSjP/ikLdDvawq3oxaPZysR9xyM=";

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
