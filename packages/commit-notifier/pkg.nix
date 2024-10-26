{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-25";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "b000e8f84b7e6ec7662c12a58f9fa858bfbf2bfd";
    fetchSubmodules = true;
    sha256 = "sha256-/PZLSgWQdy9oUdH6WrO58svGnJocL+AWUAriwk1AHxg=";
  });

  cargoHash = "sha256-Vqs23XQshIMrvVNbycpjZvwmz3ItcXtvxa8g0MuZrl0=";

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
