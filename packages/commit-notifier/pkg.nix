{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e9de51d9451f777c57c8e7e69b42439e28f2c445";
    fetchSubmodules = true;
    sha256 = "sha256-ep7CJk+nLfTtBuA2+duzKdTRC+vfLyGIGWKZMc1dGns=";
  });

  cargoSha256 = "sha256-cnIIbFABlTuN8DP2J4RBJh5+y5MDkizuRwHjwJlfIEc=";

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
