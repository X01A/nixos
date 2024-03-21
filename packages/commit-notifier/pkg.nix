{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a77f2b68052aae27f7c739a44b5d208694d8ba97";
    fetchSubmodules = true;
    sha256 = "sha256-G8h1dYzQdaXLV+mY4Zkw7ofycgGL6TVV7eAzNJRXSDI=";
  });

  cargoSha256 = "sha256-YB9FaZd1/heks0muZ7+lKOdSQnicDLavWJdaM44T2BI=";

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
