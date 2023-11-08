{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "af418b42944e1b1806e3a7cabbac2dbfd616de12";
    fetchSubmodules = true;
    sha256 = "sha256-O4Kqi6xc96drz16jtwWm9Q/9JlMVFeOSc+EzPYyYMv8=";
  });

  cargoSha256 = "sha256-0YJkMzsixlCzyKAGDpvQiW50n2wKrggR6sFUhRU9QBU=";

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
