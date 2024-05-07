{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "abaaec60f193c39f2ffd5550ca9a502538705b56";
    fetchSubmodules = true;
    sha256 = "sha256-OdlNwc9zYlha0nfqdfsmm0kTjFOIDJC729tmLnUCnMg=";
  });

  cargoSha256 = "sha256-gcaI17JBXvMRWJbR2xB+/wtrSj+Np8vYuB8EVoDzRtY=";

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
