{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ececca451ac335a9a58b7054ab55a63af8d1d7bf";
    fetchSubmodules = true;
    sha256 = "sha256-FZrr6bae8XMjKs7MLypiM35Tqyua390YgZINZ9EtTLY=";
  });

  cargoSha256 = "sha256-REDF1+nSWdJq3g70E6BPDn34IOga/3wsoa8i48uZX7I=";

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
