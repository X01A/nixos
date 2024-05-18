{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "804db17235e072f442306c9794a49e8265452396";
    fetchSubmodules = true;
    sha256 = "sha256-BM/WPy/AwgeGAvo0D3iBZZqbKBMbqsZZrfFRiyUa32M=";
  });

  cargoSha256 = "sha256-Te9iKyZAn4vVEIz7IjAZY6IV4Wd4db43yuNuORxgPsU=";

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
