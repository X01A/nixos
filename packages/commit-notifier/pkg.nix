{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e01edb8d02a19c6c6c5dc9edbee2736e90412660";
    fetchSubmodules = true;
    sha256 = "sha256-Qee54xgSRD9y9Bbv7OwcTTzeQUJpVTesaY9AJpKMOn8=";
  });

  cargoSha256 = "sha256-QIt7OWcIW6roL3pj5Z6SwtTvwmBmdEs0rDiKpLnaPj8=";

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
