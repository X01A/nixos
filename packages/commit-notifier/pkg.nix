{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "172f5a42ca54c78cf9b0fd2e7f26f3884e3755b2";
    fetchSubmodules = true;
    sha256 = "sha256-8JXyNSHgxpRbPzv+JuyF/G7GMsSm2bwwUr5zq/piBW0=";
  });

  cargoSha256 = "sha256-5+ieTdDR+Uf6I40Dcgi5ZDve/jDKyprjgO9cj7d6K+M=";

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
