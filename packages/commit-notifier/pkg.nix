{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "fd86a21a0fc0946865772dd5fd9954ba4f2c68bc";
    fetchSubmodules = true;
    sha256 = "sha256-VQamnSuIJ7C7yp2iBr10dnAs4tv7JM/Xu5p5veQxmeU=";
  });

  cargoHash = "sha256-L7iJZz8eewaUDN2Sb2kdFq3WcN0EVT5UA9a0oBIO5f4=";

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
