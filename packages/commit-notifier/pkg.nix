{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "569c5083f62557bbb75db021ffc033581f8e1db1";
    fetchSubmodules = true;
    sha256 = "sha256-N/O48VI/K2EMi5PaSpruz7ZRi8cTIsb6AnFe345KOZc=";
  });

  cargoHash = "sha256-orn5XgmnVTWPY4McgdVgL3sMni3GQqF2DnBHdjO0LmU=";

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
