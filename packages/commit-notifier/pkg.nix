{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e26571aa6a3aa5dfd91a5406caa34d5732152285";
    fetchSubmodules = true;
    sha256 = "sha256-gfPs/TB8BeVXFgFuRLeltkYoEah/sWWhHAOZpkNfn8E=";
  });

  cargoHash = "sha256-L+ZNiPzygiVV0Kl8ZFtN5wgVqzgwMTR0F6k0HeZuEBs=";

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
