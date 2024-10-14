{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4c50bbb1bf9549d67debc11db5928be46149af5d";
    fetchSubmodules = true;
    sha256 = "sha256-r2kRJOR5UEkB5osL6NFOkS67Zfjt51aH+t+F4x/ndPA=";
  });

  cargoHash = "sha256-EY3zo4EHocXifVgCRa7zA3lH8NZD2hRKXnNvpcGU01s=";

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
