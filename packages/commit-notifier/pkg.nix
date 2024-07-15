{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ca5aed13decc32fa4c90c46fa8c2b876763ccfb8";
    fetchSubmodules = true;
    sha256 = "sha256-kcEvSPp7XSaDm4ijtE5Wp94BgeY9AgVzd3Yw42Qws/E=";
  });

  cargoSha256 = "sha256-QBgi58EjdUh5qXIwmOT7W9ttKi3kAXLKCO03o38l5Tc=";

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
