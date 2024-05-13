{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-12";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e98dd826e00f364d661affb4a485cd5d12b34c7c";
    fetchSubmodules = true;
    sha256 = "sha256-LKrj4mIHoDamvcngJ7GmOL02Qw1SaH79vBbjEHV5oWw=";
  });

  cargoSha256 = "sha256-QDrLW9NM3fWZg9Vkr4ftqvwT+DO2dZvmzLwvH5MR/Nw=";

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
