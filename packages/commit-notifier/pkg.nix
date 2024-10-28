{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "34dda01cf76e35223a1271ad8be5a60f209a50f3";
    fetchSubmodules = true;
    sha256 = "sha256-VzCTC6rY8641MK9RDsKt+rwUQefoAmDMZ37ip8+5Vrs=";
  });

  cargoHash = "sha256-FcWHTgXQgiTEnY0ZMlqTxDJBVW5B8dloDU4BpccqOkA=";

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
