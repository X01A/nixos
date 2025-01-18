{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ad106e4e4289b72f7d4f0f14fa056873d6f0b3f9";
    fetchSubmodules = true;
    sha256 = "sha256-4qvv/bswjmf00yimJoCkVeUAipXoMYcOhJbVV9N25Vk=";
  });

  cargoHash = "sha256-KCQrg7wssq/kEs3nlqKyKa0SPVghzg2mJ41XIaAE0Tc=";

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
