{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "59e13a052b7d5c6b7d05fda671cf33271ddb11f1";
    fetchSubmodules = true;
    sha256 = "sha256-aJDKrmQYNY4grICNowq5PAADVzinEKMi0LeMpn4YQa0=";
  });

  cargoSha256 = "sha256-ADkfJpQiRZs8uix7rP/8zRHqOg21vJvKCOSmkQN+jPE=";

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
