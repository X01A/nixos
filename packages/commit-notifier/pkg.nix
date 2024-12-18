{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "691ba8ec28bf1b8bd93140f98b0586999337272f";
    fetchSubmodules = true;
    sha256 = "sha256-4UX1STs9UNiWSni8vIEXXYIQZsolbfvcV7vmbdmt7FE=";
  });

  cargoHash = "sha256-zfuQM7Ly9NQywIxgx8NPpCKkW0T2gVk7J/6oNKOpAwo=";

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
