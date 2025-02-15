{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-02-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d777368e97a3749808d96739799ba97db08ab4bf";
    fetchSubmodules = true;
    sha256 = "sha256-pWiV4slKwxEUEfwpn4kKpfNcYmbKV42eVqguCz0dpsA=";
  });

  cargoHash = "sha256-UdZAcPZvSW2ijHNeMs9T0xeLHGiFDnlmgSiswo5H4ao=";

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
