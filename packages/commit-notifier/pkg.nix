{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "075cb80e0b8eb963a216fca37ed2b3eee15980b6";
    fetchSubmodules = true;
    sha256 = "sha256-1VVZW6iKnTKXXE4mYgkpyYOfjeggbunr5BW7xUejAo0=";
  });

  cargoSha256 = "sha256-Cxn4DJV06ElhP3DWOvTfrwupr8KzfEFKWcUAGl8taCs=";

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
