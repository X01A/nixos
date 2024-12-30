{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1373adaed5f4405c1d7bd4ae7c8323ab6a892106";
    fetchSubmodules = true;
    sha256 = "sha256-wSSSOkBTWb1J9gHz92AhYJ0WbMexaimSv4UIzrRofBI=";
  });

  cargoHash = "sha256-AIHfHPlOtMqtTKb70q2pf/L1qadmy+YffKMYP5ond3o=";

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
