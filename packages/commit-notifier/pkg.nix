{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "08768c4f4f5bc99cf2ae834bd4a1f258e0fa3ae5";
    fetchSubmodules = true;
    sha256 = "sha256-LLoLtkR8O1tYGuDcjwSxYNgsAgLpSAioW/9qHFV5iBI=";
  });

  cargoHash = "sha256-AGVNYNzKswbFXV28WvjAk1csRHtyqRNNB+UsopGvkI0=";

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
