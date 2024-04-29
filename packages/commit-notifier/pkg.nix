{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "406f60b51332ef8968d76d3f3a24d3f89a35324b";
    fetchSubmodules = true;
    sha256 = "sha256-l5kfMhPCvYalvkePq99dSGZJXEmN18oJLghGLCj1qcY=";
  });

  cargoSha256 = "sha256-BvG+7NJeVJAzXL5FzL58ACA/Z+IZgjTyrh3ljmmBE+U=";

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
