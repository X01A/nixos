{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-31";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "91dd87e9c13b4a272afeffd0abc5602328f1b23e";
    fetchSubmodules = true;
    sha256 = "sha256-KDbVc99pcpZuRq/x3zlHTRoVBCE+U4DwSU9WiMI/oik=";
  });

  cargoHash = "sha256-y9naUQ0ZBwuT1nLQHS4mglKElT0GZ20xYQaZ713++bY=";

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
