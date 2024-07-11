{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "2021c3aa57c0e0f7502b93c55171bb26d967a17e";
    fetchSubmodules = true;
    sha256 = "sha256-6PTcsVlyOX6dJT3kyNdyd5XYjraVV1FKfRk7IvcH8eM=";
  });

  cargoSha256 = "sha256-i05oLyigGV9H3Gn1AZgYNHH2UVJVqXtAhmuexEbtPbI=";

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
