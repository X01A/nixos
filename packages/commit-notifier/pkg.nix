{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8dfe1d9da0cea5f4dda5100b049fb213ad2206d0";
    fetchSubmodules = true;
    sha256 = "sha256-1kw+P0mNhy96MjPxJXCI3wGdB319TfNrsEO/JH8+qPc=";
  });

  cargoHash = "sha256-qFYWnq2resaYz+eCIFJ2DNsyG+0Hum4apAYurudmOUk=";

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
