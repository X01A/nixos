{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8269d891f243a6ef3de2dd3dfe44c4e478e9d7c3";
    fetchSubmodules = true;
    sha256 = "sha256-YUvHHi/6Sll5+F4z3eIyR8DEQC4MSMv6H08TbV8fKZU=";
  });

  cargoSha256 = "sha256-CUz/gvxs5MeWxOLx0oNN8c1dFl9SUonNrSoTbdqrQFw=";

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
