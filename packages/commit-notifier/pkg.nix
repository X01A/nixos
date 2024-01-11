{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f86efa2f579ca93aed89d4dd64e212a5ed237381";
    fetchSubmodules = true;
    sha256 = "sha256-y4mFU8JwpPNrmVeTX4uRElzaLM7bY+NaVirPPCgosXI=";
  });

  cargoSha256 = "sha256-p0t9WhvLXOqJ/RE2s+r2hrHV3XpAs0qIPDh/u5jSQ8U=";

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
