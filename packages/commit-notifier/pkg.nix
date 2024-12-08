{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "2658525a82225c5b9d536b024ae0378844e3f247";
    fetchSubmodules = true;
    sha256 = "sha256-a2JwytXKrdSczgEZoYcU81nW/7Fwc8kMyLYMEeYBX9Q=";
  });

  cargoHash = "sha256-lxC2Fq/XaabkRP/QdapG1pvH1onxHXF39n2YDuiGG+0=";

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
