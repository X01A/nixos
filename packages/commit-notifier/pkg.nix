{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-02-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d5de9f683faedd0ec7813943d0f90deb0e86ecd0";
    fetchSubmodules = true;
    sha256 = "sha256-fy6QCttNnOF3q8VhdBKSo3h21spZBwtDAO2lWjBuJ60=";
  });

  cargoHash = "sha256-qQkvOfh/a6Ie7+L7yuAINFkMtyAZV91sErG6nbJoyYs=";

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
