{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1a7dd1086862842f2160e9b5a966d24bfa88daa5";
    fetchSubmodules = true;
    sha256 = "sha256-H2F8+wOJblQDsGmJzDd3d5CN8PHjSh1FG3+jr5RVdZE=";
  });

  cargoSha256 = "sha256-kGq8bQ1aV70+MEkPQLEyxcUtaki9Ne5q+a1+S+ZwV9Q=";

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
