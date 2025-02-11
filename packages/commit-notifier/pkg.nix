{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-02-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "b432cf9251920ea8c1ba1463eb5a47826eb29449";
    fetchSubmodules = true;
    sha256 = "sha256-znAp14ZhkGF0vJ2MsCnOfAypsJhSYLZRvO1iYdGzIgQ=";
  });

  cargoHash = "sha256-YMjqJqdIFcjDUE+tDhbLlXBJihoHwxPwBIru5bdVTZA=";

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
