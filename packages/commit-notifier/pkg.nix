{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-07-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "231808a3529c54170f7260a278c3aca7358ec8dd";
    fetchSubmodules = true;
    sha256 = "sha256-TmgxGAE+ObfpazqLXHrKjBJOhheNXg8XHZbrsnC6BOo=";
  });

  cargoHash = "sha256-99dqg39mep/L+YiBeiRCw2khs8L1HWAC0JC8/3GaVeg=";

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
