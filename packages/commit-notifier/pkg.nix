{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "bb80eafc236fe22d5389c0f21a21c59c250d40cc";
    fetchSubmodules = true;
    sha256 = "sha256-62uBVTY5hMg6AerDL3QQkVxB5Ug3B3wWEFu2ZIeK3Kc=";
  });

  cargoSha256 = "sha256-xVci9AyJuSh9d1eyVvQn2JFqEMhmXfZpVoFFodxM5Tc=";

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
