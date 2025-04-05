{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-04-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "706b300b15a84e4aab72a35cf726dd5e9e339b01";
    fetchSubmodules = true;
    sha256 = "sha256-O2XvoixStInfAf0G+rDNwVuldWhexD5Vc5H/4784SJY=";
  });

  cargoHash = "sha256-HztR53o1hcIXMdJEFAF5XqJmqKefFy8yyElWeFurfus=";

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
