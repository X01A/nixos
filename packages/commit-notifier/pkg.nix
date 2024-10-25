{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e40c28da8a18aa4d657ec113410aee1dd79c5040";
    fetchSubmodules = true;
    sha256 = "sha256-TZHlgAziYrX58LkwAhCheqq0ycbhS8bJZmKoZTxeKeE=";
  });

  cargoHash = "sha256-SJUwJCrRH1gjOBgRrWiXUTeJQ3qfHxxY289H7Ntl3MA=";

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
