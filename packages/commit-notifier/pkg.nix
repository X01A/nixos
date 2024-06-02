{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "fa0265a758ffeb36abf97345a97bee2c185c85c4";
    fetchSubmodules = true;
    sha256 = "sha256-ub6H68cTrThA6kG23dbiwVaU9HwEO6xwPLKhPvEklRo=";
  });

  cargoSha256 = "sha256-Jl0AZ7AkH5B1VmHqXEqKJ4ZAIOsFP3ddCMvLHk+yyGo=";

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
