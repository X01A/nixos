{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "11dd80c2e7011f01a8cee501c59513dec0223e73";
    fetchSubmodules = true;
    sha256 = "sha256-cbQCVSdjMIVhQH6mJr4ZASRZlXI1uObOiOU/ESgvaxo=";
  });

  cargoHash = "sha256-EHBFs76YjH7JfCfY65fuuxv3dHWkgenz/YNZlY9nLME=";

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
