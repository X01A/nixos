{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "2a4c86092fc05ac38927ac85fd864fa0cbbca9d3";
    fetchSubmodules = true;
    sha256 = "sha256-N17TsCDE9CZxEXypDjHXY/CW8o5706IA0MFhcc0ZEVo=";
  });

  cargoHash = "sha256-A+uZZXr9FVLxX+GhpXLJQLeOZ2BfHey7gSosYcrXl+w=";

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
