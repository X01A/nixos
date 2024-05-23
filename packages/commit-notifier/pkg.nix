{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "dd0648f480f084ce1b9193234b48e86b74715cef";
    fetchSubmodules = true;
    sha256 = "sha256-liVDofDp5wvZT2br3BjeOErMQQl2wmwqD7icq/tdru4=";
  });

  cargoSha256 = "sha256-tT10Qku9nfs0CbBDUsEJuD1z2cOfI0LrYZZbVFU2d8E=";

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
