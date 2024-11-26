{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-25";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c2c3ba6504cd0856b250b19fa55d71eb06b81352";
    fetchSubmodules = true;
    sha256 = "sha256-tW2DTtAxhygTOWuVGFTN2Y725E4a/hHgsTTQyiwxcLA=";
  });

  cargoHash = "sha256-MH/hBGDq9/Kc1PRIpshZzT9QmAEdVUte/K25LAvGJV0=";

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
