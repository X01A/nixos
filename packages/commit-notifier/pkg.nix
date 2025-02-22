{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-02-22";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "555e0c1d22065874b9d0f725e0bf61b2066c35f6";
    fetchSubmodules = true;
    sha256 = "sha256-04mZbb5gUn7YG8zqEtXWaXPcIsX5TE/NZxAdUFLi6XQ=";
  });

  cargoHash = "sha256-4KGOWIu5kE61JhfXFLnO+JSe2FLU1zmRyj/r7d2z1qk=";

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
