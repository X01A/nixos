{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-11";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a34bf33ce29b10e38c1e03223c77c6eede7fdbe0";
    fetchSubmodules = true;
    sha256 = "sha256-Lm+vlz8WXEkPC9FgOg1xpcJE12/reF0HPaztU8fhNuI=";
  });

  cargoSha256 = "sha256-VXQAb8Hd2ex6unjF1JtycnbtV3bVA/z6AL9s3Rb3j8g=";

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
