{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f57bd6f7d1175e520c197787ec7be26cd9ded72b";
    fetchSubmodules = true;
    sha256 = "sha256-XGVuR537DdLdx22rA8zsSCGZjSD6jA6SALliWDogxyQ=";
  });

  cargoSha256 = "sha256-eBFIizFRMoKDN9dNusNWu0vAP3EurLw4t6Mi3K6KkmQ=";

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
