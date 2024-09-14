{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "438534b6389740eb07faf2848ec899116fa882be";
    fetchSubmodules = true;
    sha256 = "sha256-UQwrS7A0zn9PXZWKBSJmm+pfGiMis45tAaGUuactmpI=";
  });

  cargoSha256 = "sha256-taxxq8pnJz2uaiW846KJfOqHlKlbDSMh81DVTc10gU4=";

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
