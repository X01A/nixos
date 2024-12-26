{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-25";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "15243b797163c37805eaf0b92336c73fc98e50c5";
    fetchSubmodules = true;
    sha256 = "sha256-MwHVarRaZYoO/A0iJKWinKIeufNApzuSBos847orcv8=";
  });

  cargoHash = "sha256-Wiww8xKxQsruzPn+LnhO3CGN2YaQxmhjGCbYbSoIm34=";

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
