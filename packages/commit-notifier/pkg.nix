{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "74cf7b13f3fd7016a6464af6fe2de64c95a61ad6";
    fetchSubmodules = true;
    sha256 = "sha256-LPRPSSv4/p7tTGRA19KaVDwutDo2ck4sks+mw77hYao=";
  });

  cargoSha256 = "sha256-2GRN0f0OBsOITPjtlB8PTHCMBxcnSZD+VoTZhmRHxrw=";

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
