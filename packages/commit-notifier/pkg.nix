{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-12-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "dde937630e7be3fc5918579f2fd8eba50e0d0a66";
    fetchSubmodules = true;
    sha256 = "sha256-NMKHcW00lOC1vlOkwmST6/tW7TkHaqqaMoTWIblTWdo=";
  });

  cargoHash = "sha256-lMF4jLuXFLvtCjctyKSVkiw+mGP8juwqMWNJCX80Msc=";

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
