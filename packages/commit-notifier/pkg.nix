{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-03-25";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "73cf28cd7d848570b76d7be5554f9dec14caa5be";
    fetchSubmodules = true;
    sha256 = "sha256-4fyyxPT+NiBIwLzbc9S0BWEsTPjOKCVB4764QIK1kb0=";
  });

  cargoSha256 = "sha256-//p1SqVpCt9VFksH/XJFGa9W1wN3f0Jno/r5Zkccpno=";

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
