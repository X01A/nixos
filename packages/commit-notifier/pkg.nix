{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d180dddc15a406a96eb8b6996db03f9df3a60d6c";
    fetchSubmodules = true;
    sha256 = "sha256-n472bhAdslKd6ByL1CudLVoGJo0miW0ttdjZ+HLA79o=";
  });

  cargoHash = "sha256-RgyRE6Tb7ZEHxV6c4/ONEwDH7JW/d+M0LYYOEqQ956c=";

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
