{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-03";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e3484725c26527ac3897462359bce374d156dba4";
    fetchSubmodules = true;
    sha256 = "sha256-jlfVS00nPFtQt8tlnCSpt71evjOMilQfLI9qvtHQTvI=";
  });

  cargoSha256 = "sha256-yshCCpP28JPoJyc8wRr91UDaRO+9cOOkOKP73FnlnZo=";

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
