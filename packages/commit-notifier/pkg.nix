{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-03";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e0d3bc23e1afc2aa44bd60fc19e2efe8d77a56fc";
    fetchSubmodules = true;
    sha256 = "sha256-qTldVbLMYGWL1nF+iUVKcfmPp6MpbmP6hWyoxZzfluw=";
  });

  cargoHash = "sha256-MYgaxOkvoBEbF9dRzOkQVWuoPsTdNaqxs02qkyToj6E=";

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
