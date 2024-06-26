{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-25";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "191555b31ce24039148d258f23fde3be4f1d2262";
    fetchSubmodules = true;
    sha256 = "sha256-xtIYEBU6dBY6ERTOsNXtOIH5LQTLlz05voQkgpPusbQ=";
  });

  cargoSha256 = "sha256-DgPUYqW+zdLOZxO7SDpaYTgrRWE8PyqxXCX9G7zkC2c=";

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
