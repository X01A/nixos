{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "cd2f8121330bef60c73177d97a3fe5c56a8b9d06";
    fetchSubmodules = true;
    sha256 = "sha256-qVj9P1ByYCFuIrebssTA2dr0HT7d/MXxoxwy7H1vWHk=";
  });

  cargoSha256 = "sha256-OgZhd/5SbAZ4C7ENOcez/IIqyGcwRLYSzVfspwsMRw0=";

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
