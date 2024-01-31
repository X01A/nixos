{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "588938cdca677d6044d862e16ddeb9ae6417b23c";
    fetchSubmodules = true;
    sha256 = "sha256-vLHC6nsIv6s1gRrRsB+mr9OsTqCNdJKfFmv3an2kMjw=";
  });

  cargoSha256 = "sha256-vRevi6Z3ToUiJTcJGQDu936vcYFHWTZE5tzUVgodfM4=";

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
