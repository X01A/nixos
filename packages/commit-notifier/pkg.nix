{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "448c9e4dcb3a1f0ab0e10f283552267e6d6270c8";
    fetchSubmodules = true;
    sha256 = "sha256-TpGME3CA8sEHE/Ql0q76FZMgfNcSnLa5+x4LYCN1WoM=";
  });

  cargoHash = "sha256-OLbm1NHIKNWfTTmA39ZyYp2Cgyoehiz2Rdf8RHG6hhM=";

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
