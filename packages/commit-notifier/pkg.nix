{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-28";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c812233156a549be6aa8096d38f3ffc550838ee1";
    fetchSubmodules = true;
    sha256 = "sha256-P2/BiNoyyeOOD0H71rwj2v5+Na40FUKVtRCSeepOO+s=";
  });

  cargoSha256 = "sha256-WKUaD+QsCU9un3kewRgBaJM2QYORwClHysthkSHMiz8=";

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
