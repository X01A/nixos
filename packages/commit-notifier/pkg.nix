{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-28";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "cdfe60f7f8118bb3598ddf527c0d175550538ce2";
    fetchSubmodules = true;
    sha256 = "sha256-shXQXUh2PWG3lKlYxoh4MNxJIbkD4YYdCWY5AObTOT4=";
  });

  cargoSha256 = "sha256-VomWDmOH8NxwivSoUf8ve0PRMEeEkhW4gGDHBguJ/Qc=";

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
