{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "297bfc925228dd26a7bfa3441a00a0bac0a1345b";
    fetchSubmodules = true;
    sha256 = "sha256-CGDu2lyYsC71XolsIuakXwhY2+XVYDRv7MpnZcUVZ/c=";
  });

  cargoSha256 = "sha256-aUuvSu44MtlUlxOWaTn4LPwFciewhEPCunJvou/2huE=";

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
