{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-03-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "dc8ba5c92cbb7211335ffbd64f9ea878d1778136";
    fetchSubmodules = true;
    sha256 = "sha256-UIjn15HwEcgIUjU8/lACcLtnw4PoECYZn5R5U8PbllA=";
  });

  cargoHash = "sha256-nCfhnOsvXZVamyhySYq6jmeOUE/Izw5m8GBX9T3ZHDQ=";

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
