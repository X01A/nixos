{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-31";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "acc2e92dbb779ac27f5e7db72f48607c413ad71f";
    fetchSubmodules = true;
    sha256 = "sha256-pgjwvw5MaWeJGenTfiawU9tSaEtoWOaSMC604v9jSeQ=";
  });

  cargoSha256 = "sha256-V6PUn2V/YqrCDU+79iDM+6Fqn/TONuFtBgawmdcjda8=";

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
