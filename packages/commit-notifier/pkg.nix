{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "fb3138b8117500637aaebc5067c06d41994e2e15";
    fetchSubmodules = true;
    sha256 = "sha256-JRnmXoVmulO2thBNsEPY0p9r0I/j2zRoaIqO7EJRk8s=";
  });

  cargoSha256 = "sha256-dcbF1u71feJX+sFn33ghlGmRFuptvKabqNZMcfU9y3k=";

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
