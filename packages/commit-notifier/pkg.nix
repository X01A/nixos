{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "40e1ad7eed0958cff9ce2ebb56448b6cd8f88e09";
    fetchSubmodules = true;
    sha256 = "sha256-lI9DQXRUS0CYRPiBhJG3TT/4h3zuVnMoTs0n+nCAeHE=";
  });

  cargoSha256 = "sha256-N5217WazYcIBHKfI1+8hzYY2nhoPd9mY21x++Hle+Ok=";

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
