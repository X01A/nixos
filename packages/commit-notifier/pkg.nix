{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-09";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f10193c539ba0eeae1bc2898f61265ebb95b1e19";
    fetchSubmodules = true;
    sha256 = "sha256-AdoJF0o+oSgkd9FjZb1dtwK6E536mKqoxUNzsACvgG4=";
  });

  cargoHash = "sha256-a8fqQKMdu3fbjYKl5RxeTs2fIoUEABOT3ci/sYdhfCY=";

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
