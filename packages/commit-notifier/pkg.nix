{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d950bf25e4083da92806f897fc2884fbb475c820";
    fetchSubmodules = true;
    sha256 = "sha256-LoI3rrhQ5ujsRzaIhdF+Yc1GSKQ2/Qkt8NTliFe1NVA=";
  });

  cargoHash = "sha256-Ul2FllfC38+62/3ERZGxTycwtzVezd4DeOIDsx3KqfA=";

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
