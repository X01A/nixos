{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "27bc7da235e5c44e4a632e8472c19d884cd92039";
    fetchSubmodules = true;
    sha256 = "sha256-NJu/4kdJJJYhrVe+4HsrjLiXa0MdmngtvXM6Zwro+rI=";
  });

  cargoSha256 = "sha256-hvcT9PBL0uXZzJ432CWytctw1pPQDOfcNi9jM841BLY=";

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
