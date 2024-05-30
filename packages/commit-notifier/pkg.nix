{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "18630cfec0affa65dc29b193d2bb5543aee9cb4a";
    fetchSubmodules = true;
    sha256 = "sha256-1Hkzu2taxG2yxI06LBuoD/nXS6aAZRCOX0UJuvjG1qE=";
  });

  cargoSha256 = "sha256-y3WN+cKIfMT5Yt2DnuN7f+liR/Jp5hfHqt3Kzo8GtOw=";

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
