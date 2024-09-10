{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-09";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "71d5cfc728624d9663d20f49d8c9dc7915c4927f";
    fetchSubmodules = true;
    sha256 = "sha256-fM/zetIH3EZjSRDWz0xw8pBK6ktiGEeyhpbA8u8mQm4=";
  });

  cargoSha256 = "sha256-PKlbAHFZuMLuStx5vMU25cdEVvZzDpj4urwLMyMsFDU=";

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
