{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6b9f023913e0e1b92b89d8e1a6baf80f3edcd464";
    fetchSubmodules = true;
    sha256 = "sha256-SUD3ykYbwfek6uyKWs1fWEissp1UKIFxCKBVSv+6GbU=";
  });

  cargoSha256 = "sha256-mY3jjHr2ycsnwlgYRf9vvW8SofCFd0GbZ6rCADxmIFc=";

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
