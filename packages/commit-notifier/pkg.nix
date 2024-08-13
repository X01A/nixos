{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4de5875acaecf7561f3ff3d438721b6a9499511a";
    fetchSubmodules = true;
    sha256 = "sha256-YSUe+F+qO4CyuG6G6Jjk3ww12/Svc5sVMa0HDlnUyBk=";
  });

  cargoSha256 = "sha256-wndlDLLgZAY2Ek21KzMUfZRkR2ecjyqE8p8+jsco0vE=";

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
