{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "67224d0733680dec7f7149422392880de3037453";
    fetchSubmodules = true;
    sha256 = "sha256-qM2XCYw5botUcQg+7I41aLli3FVOO0qvtphXCDoJV/o=";
  });

  cargoHash = "sha256-FjV5PWhCn4T1ZLJZsz21wgFp3yyTruMsy47p2Bce9LU=";

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
