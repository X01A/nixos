{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "2688f385260dd79be09d1c24aa7a04f75bc7e8c3";
    fetchSubmodules = true;
    sha256 = "sha256-uJvgDZUZOxSTvxnWuCPlx6R19acntsxW7w+Q6zuUNoU=";
  });

  cargoHash = "sha256-KSEKdq5iEX4wl4s4QQtvt7D1BbrYXYODSCQLhC0/prA=";

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
