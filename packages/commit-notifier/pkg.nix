{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e6444eb5e4ceaedc94ac7c39c032ed624866706f";
    fetchSubmodules = true;
    sha256 = "sha256-DYwl2Z1FmsinlPqEg0EBfqFNtCN27Bp0Co9MsbofdeE=";
  });

  cargoHash = "sha256-ARTMa1NsAFqjBrRsQtu9GktNF271rC2rs6NTrUWCL98=";

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
