{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-31";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "3279a10eb86d49cae9f7f1f0a563646d549f462e";
    fetchSubmodules = true;
    sha256 = "sha256-mDGntNemwhlc7NAqqvlotz/zHiec+uwT5TLFRxS1oGk=";
  });

  cargoSha256 = "sha256-Tsy2lzIRlb+O82EWg8MBaZS++KQ2V2VDsABxyecgp1s=";

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
