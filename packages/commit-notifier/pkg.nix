{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a1b4a6dde6436dbff94e4041212e843d4caa4285";
    fetchSubmodules = true;
    sha256 = "sha256-+yhrskODjOxdIMzncaCn+yWcl+c11fvH8yUjLtD0XEU=";
  });

  cargoHash = "sha256-naVMuAvVR2+x+/WEUVlgbCd1t1kfHYyZGJhH1NhcORQ=";

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
