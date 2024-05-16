{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4b32db2dc57bfb20cd67df75706f9b5d9602be4f";
    fetchSubmodules = true;
    sha256 = "sha256-bAobHC+aQNIpi325nGr5phaaosLWjq/vuoTLYwhdA9A=";
  });

  cargoSha256 = "sha256-bJx1gTyvyiq1n7r2x8rT9CKxPhZLecUDpbCXiwH3y3A=";

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
