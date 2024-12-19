{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a9e595736215fd83060d0b580ab52fd1c26eae51";
    fetchSubmodules = true;
    sha256 = "sha256-kdcgIDRQ0epTnx9DxKpasRdKlXsy6DZq2iGSj42dYBY=";
  });

  cargoHash = "sha256-oTTjGJBq85VnroOLZQNaSTotvicpVru3qGxdWjJ80HY=";

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
