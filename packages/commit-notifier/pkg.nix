{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1379967ad3f184ee2de40cad1acf99379331b79a";
    fetchSubmodules = true;
    sha256 = "sha256-/NdmMFVviysLK8oEesujdgR1B8GgvMLM0+pFmCansCY=";
  });

  cargoSha256 = "sha256-2cpLCqxIIHHTrLOZZZebNBAiEkbvL+JqqxIPBLAUqPQ=";

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
