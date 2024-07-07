{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1cceb503c5f09759ee535bc79fd3d96f5eeafa96";
    fetchSubmodules = true;
    sha256 = "sha256-v1XRXHBIl6yRIqdfkHePJIf2Ma+z4Kd2EPLzaiK+pp0=";
  });

  cargoSha256 = "sha256-SWk6Z3eI8N7BuArLdOqU30THPwpIL/Q1OjLQpWs28n4=";

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
