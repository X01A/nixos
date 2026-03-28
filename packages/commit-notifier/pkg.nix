{
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  zlib,
  libgit2,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2026-03-28";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "b062812d34d9ac3abaea5ff6f681fe5355d583f4";
    fetchSubmodules = true;
    sha256 = "sha256-Xbc80vCVfRsNQ5/u1VvqSnEFBTkAkApd+P6lLzy7Jlw=";
  });

  cargoHash = "sha256-OM5s6rhxrp9VovXwfcbH8YhfH/HeOsCqfKUjpw1+GwE=";

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
