{
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  zlib,
  libgit2,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2026-08-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "3ebcb32da40dd0a3e031e9ce878e4b5e2f48171a";
    fetchSubmodules = true;
    sha256 = "sha256-ZstHtdmZzDMmhb0GPLqDBinm4VBIrB2ZXTS7T4KC+kU=";
  });

  cargoHash = "sha256-XmYi2iLJLlQ/LLlI22gJj5/DP5KkCwRcM6MOu1PMAHo=";

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
