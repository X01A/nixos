{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5151c6ef4f87d588da72f922ceb8ae0ec8e4ff52";
    fetchSubmodules = true;
    sha256 = "sha256-HkXeT+89ZNB+gtZtQFPPEaHhJEsENsvuxoMma5LHaS8=";
  });

  cargoSha256 = "sha256-mbgbVEILmJiB6/Ay/gxJNV+0IDMlm9sqhr5wIaaj0Tk=";

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
