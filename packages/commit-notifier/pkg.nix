{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "017c6746e4a23c2e247ee572ca32c3aee688ad5e";
    fetchSubmodules = true;
    sha256 = "sha256-vaLaEjsl3801c+5G+yaTaFGUyP2lUUpIOqBcuV7XUXQ=";
  });

  cargoSha256 = "sha256-8cvNCQPrxr4+Tc8Tdq16cAVGZsus0rjCpgXGo9WTquo=";

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
