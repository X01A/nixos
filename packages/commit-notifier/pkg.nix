{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-25";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f36768e700823ef7ccca439fc973a24b52b0dd91";
    fetchSubmodules = true;
    sha256 = "sha256-VazeRRrEEZXu3zVZ9ETvNHmBFeSW4SJ4hSMz0fjzZ/0=";
  });

  cargoSha256 = "sha256-qFj7ZSMH43A959iyjC1PD4kWJLqyffkg/pyjBP5og+g=";

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
