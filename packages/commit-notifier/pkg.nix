{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6ccc8eb6ed0a881e9e800f77ccab884b719c1461";
    fetchSubmodules = true;
    sha256 = "sha256-xnD6i+hRjadnte6T2Yb3Bkh/4Hifu/qF/wgSh6ax3gI=";
  });

  cargoSha256 = "sha256-TdGSswM7GeFBbEZh0zTlM8gtK9WH1bNNtrpT6QsiTQ0=";

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
