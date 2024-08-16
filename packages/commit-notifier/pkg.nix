{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-08-15";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "dfc333cb1853c5cad9a65a9c44c09eb81dc6104c";
    fetchSubmodules = true;
    sha256 = "sha256-Fwv9EsrQQWpyHujMIsONFJKKLEyETzh6yr9IUUUyp/Q=";
  });

  cargoSha256 = "sha256-L6fzWttIkWRWOyPw2tDsBzGh05zG5LdzGPT3L+bbcok=";

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
