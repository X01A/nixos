{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-03";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a8f79c302a032078eaa76688b1de20309d4b57b5";
    fetchSubmodules = true;
    sha256 = "sha256-0pZuiIFQTh5yAO5b7fuxusXQo51PZVHI7sDfUXnA3F4=";
  });

  cargoHash = "sha256-CT92XGEPTAFP7HXlnIOtn1Wa6laknSrues+60bHfhkQ=";

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
