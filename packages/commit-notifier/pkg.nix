{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "bde21414e276e9d7ab3b1bb5df0537a43a70df39";
    fetchSubmodules = true;
    sha256 = "sha256-JQwFDwnLHgedsQ+DaAwn99n8yYBApFfCzjsZgbPOqxI=";
  });

  cargoSha256 = "sha256-/XDIbHwvLIPlGaEb/ecQgcls1RSipUQN4f2zveLF2/E=";

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
