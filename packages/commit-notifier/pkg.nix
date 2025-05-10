{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-05-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "859adc94030dce61e46a2f4984b568ccd7e5108e";
    fetchSubmodules = true;
    sha256 = "sha256-4ykS73YSV/q8MsECcyVI5gnZZTBG3D7OvnLvQBIciGs=";
  });

  cargoHash = "sha256-BcM7WmwZS2vEsJWEfSR0dGi4F7UIE/pIa+kphCz4Pxc=";

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
