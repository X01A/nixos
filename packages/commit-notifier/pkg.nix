{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "47b4f12b99d88a100e13ee0a5a40705c139a13d7";
    fetchSubmodules = true;
    sha256 = "sha256-ecP57RQkaocKeogRAeWelPBec2zCJDs0uFAHFGQtRe0=";
  });

  cargoSha256 = "sha256-CfeiF/Z5wjKT5y9I7yUJ1pVXgfUnxHAJMlGq7EbinSU=";

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
