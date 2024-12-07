{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1c07134b5a9d3af247094742b7ec7d0c013a9d94";
    fetchSubmodules = true;
    sha256 = "sha256-+w2q9UPLizSBYUnaBt68TzHR6/UVpIIj0tEMHtK+1fE=";
  });

  cargoHash = "sha256-5XaEdQ/croT6JKhbbxQZvu3l8+kncyHO2BNfE8gOOL4=";

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
