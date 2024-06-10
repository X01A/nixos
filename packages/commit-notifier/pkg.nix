{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-09";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "adfe8a3f8fb5fc87eda5ab0a764870653a1101ae";
    fetchSubmodules = true;
    sha256 = "sha256-bdoXa5HSbsnG42172skKU7NASnqhHrIKmXNZQoxpKJ0=";
  });

  cargoSha256 = "sha256-BinMFsnegKreoAS55KpycNJfYhDLuQTS5I79tjIlaAY=";

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
