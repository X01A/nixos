{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "470a5dd5e5f27c08e7a8013710dd636cffef9296";
    fetchSubmodules = true;
    sha256 = "sha256-TQMvuU3D+GVmhWKStDWyF84ZcHi+LacwNwxhD67x+qI=";
  });

  cargoSha256 = "sha256-RKSaKbMWRrtfVgTjUt3+qZyZ0qFckg4TxrIylkK3jC0=";

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
