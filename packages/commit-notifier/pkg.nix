{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "30fc372d57ea4c40b9375de89657461e6b36f0ca";
    fetchSubmodules = true;
    sha256 = "sha256-BW/ZrRHAbjRCgtzkySEcKZCDQjKhmbvnmuHRkKhtBl0=";
  });

  cargoSha256 = "sha256-3qYl6g8NULfpIbixruCVVaAxZSfa6aYW2gl0eHzWR14=";

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
