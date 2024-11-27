{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "2231e36e6b6fe57765424df14487bbdc849068b8";
    fetchSubmodules = true;
    sha256 = "sha256-CczrQkp7Gv8FDbik7/bbZGz/iSoBNIW6Zz2Up12bsXU=";
  });

  cargoHash = "sha256-A+F7boLingLDUaGu9/rmFq/INK8LdhNXzsjGwou8ld8=";

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
