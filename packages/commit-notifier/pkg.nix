{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-03-01";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "fdd7b1beb928ae2a778dd024a8cbd7b5fd6883f5";
    fetchSubmodules = true;
    sha256 = "sha256-YFzsodASfQzucrgPV3n48Wbu/yWXP7323dSkoVuKYJE=";
  });

  cargoSha256 = "sha256-z7KTPbYykxpOLgSL8IA4/xmR5jDj9bYo5qxZynYwKxs=";

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
