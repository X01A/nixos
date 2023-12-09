{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-09";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "b3e68cd0e54ce8416edf2a2ec5cd3b657568ff9c";
    fetchSubmodules = true;
    sha256 = "sha256-GBCJtwVW4Eu216DQgkVyViuxfPYe7KbYKsqOBNdK3R0=";
  });

  cargoSha256 = "sha256-u7cdyHuaRgraCnkU0139AYmpZPAgw0y/QrxaRWULPH4=";

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
