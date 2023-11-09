{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a525f568b03225ad28b4b19d9a4326e125e1474b";
    fetchSubmodules = true;
    sha256 = "sha256-PRf/N717rIZPpy6kqNFEyY0dRi+a1lhEbhwO5gbBksE=";
  });

  cargoSha256 = "sha256-WBKS4AwaX03RJXKvuywv5X18iUrZOmOFvNqLymywlIg=";

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
