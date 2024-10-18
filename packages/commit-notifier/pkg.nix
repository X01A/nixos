{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4f914c495857d1c17642fafcea220f5e6831a48e";
    fetchSubmodules = true;
    sha256 = "sha256-QxQ1i0RPIx9d4HfT7+tXbDAV/iU+bbLynGCU6PWsRGA=";
  });

  cargoHash = "sha256-4xYaQETyTeMQCnpzXYTIo31UvsT2Fa2xOC7GaH3MZlg=";

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
