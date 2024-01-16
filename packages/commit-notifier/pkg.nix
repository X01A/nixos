{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-16";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8455beee2912e36dcd7054c1b5744107219a7cac";
    fetchSubmodules = true;
    sha256 = "sha256-7BoWxAeBEwHjA303Sg9KLLPsrPjizSDT5X/V3s6Ui6s=";
  });

  cargoSha256 = "sha256-nWo0GzX/jLkKrhNT1QteMoX/GjAscRNJbYwB0RsAcpg=";

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
