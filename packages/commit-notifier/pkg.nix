{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-09";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5ab826032068cd692676a98a041cb5ff8b5566d9";
    fetchSubmodules = true;
    sha256 = "sha256-D0O3ZUHZ5cDCx/KMoxoxO66OxGh+UnMtIbElnAAwSAc=";
  });

  cargoSha256 = "sha256-z/6QYShBa8J5VwnO0r1M5qB5HN1eq/an8I2/bgENI8M=";

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
