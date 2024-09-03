{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1f903467bd45d0abad5456751a95a7694f46b130";
    fetchSubmodules = true;
    sha256 = "sha256-cjsSQVr0W0ccXEMSwVE5+zLsBClLIHl8NOiYpcJkTN4=";
  });

  cargoSha256 = "sha256-tKdcK62o11Aat684oKpPkAXffnZIcDe3S8z2P03L8gM=";

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
