{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-02-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "07c9c329a384675838822d278c6b3959509968af";
    fetchSubmodules = true;
    sha256 = "sha256-c1Ptykdj42YTXPChhrVs/UKH57aC/vYe28hNd1SN+94=";
  });

  cargoSha256 = "sha256-X3qQJCuhGZIjJ2TvVCi32edkeQY3NBSBZtBrQZW79Cg=";

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
