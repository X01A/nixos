{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5412387738ef0bb4b31b2480d1558bdfedcad440";
    fetchSubmodules = true;
    sha256 = "sha256-hg2BfDDhL480YyXjD3wXr3mbMNWcC2F/tTPCzAmKSNY=";
  });

  cargoSha256 = "sha256-/hhRg2N7J9lPH39pmMO3pFsy1bKmWcQ7r47SDR638+w=";

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
