{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "affd8bdda648c7717a51a27fc7a39772fafed3b1";
    fetchSubmodules = true;
    sha256 = "sha256-r8RvMKBT6L8R97m18ULu0xtXw0fY03FE5uC3juilr58=";
  });

  cargoSha256 = "sha256-xbUGk/4ILKFdl8V80QCq/c5FNi4LiEXM2fKISjH1VHw=";

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
