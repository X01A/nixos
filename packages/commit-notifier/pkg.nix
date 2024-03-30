{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-03-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "051ec7fdf2cbf7c171e68a5efc01ba2ab88b6df3";
    fetchSubmodules = true;
    sha256 = "sha256-VgnxUUF1Xj/YUJOdN6ZJH77SMknkUYg2IunYBuwYLWo=";
  });

  cargoSha256 = "sha256-oX4nCak6w6IBrIuO+2Fkykx1M919rSUo+fMUj3dR+pM=";

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
