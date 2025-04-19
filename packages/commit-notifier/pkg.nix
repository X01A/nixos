{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-04-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6568f3ad4c3438c35abb376635e2f2d5de4d116a";
    fetchSubmodules = true;
    sha256 = "sha256-XJ+XmhbMCRKIa0PdsoNYeDanqasKbVB9wNLxGxWtBdI=";
  });

  cargoHash = "sha256-3GbO7y8w33cs4GIf91fQeavWHfR5SmJtaHYoYSmCjwU=";

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
