{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-03-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4941359cc78882e7b3430a798a2f4e2d9f940ba2";
    fetchSubmodules = true;
    sha256 = "sha256-I6vBbDu8nRRhrw+/+FR6PB9ElZUW0ZKKxq6SoVejaTw=";
  });

  cargoHash = "sha256-AQQHF+vPg1LSmsAL4Ea4NWLS9Enx2mUxJWul3yNLTwo=";

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
