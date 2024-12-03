{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "55db4d7f18f5f4bba2a1bef734ef3c41ff3713e9";
    fetchSubmodules = true;
    sha256 = "sha256-gyuHR5ANMtEvG2UBnknmyVBI07jqcYbWCqOO7I2OPPg=";
  });

  cargoHash = "sha256-b5wE+zUVCBvolyQ07Xi1ubdj86s6q9hr5u+J5UyVBBI=";

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
