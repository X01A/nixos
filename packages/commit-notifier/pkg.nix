{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-02-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "32ae1b614f3a52cf54fb6bb0a1e3500fa6744d13";
    fetchSubmodules = true;
    sha256 = "sha256-nIA5Lk+tNkly5F7XwZcuITeO8kMr0r4VVgV/aKZ9N80=";
  });

  cargoHash = "sha256-1Msg38JBRnSlRrOWLGlsSI2lYEWSUdyBdnyioaKG9Xg=";

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
