{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "79eced19d940398be2f45b797577b0f201ac0eaa";
    fetchSubmodules = true;
    sha256 = "sha256-BHxJhIvCwtBH8fEgkFEL3mnGfHI5SSvPLTiN2vl/JQI=";
  });

  cargoSha256 = "sha256-MOYyTaWYyVvGReFwz8r5nSdFdyahqU9pdJU73+OtMXQ=";

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
