{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-05-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "372957ae3ccbd29ef58112c3157915f235c9db27";
    fetchSubmodules = true;
    sha256 = "sha256-6j19Mp28kR8kh1hUacnnkp5Nre/YucNC+fTzanvuE3c=";
  });

  cargoHash = "sha256-XDHPtuPixs9TleH/tuxm2zYMTFZs1sAMoeMs8/k3JVI=";

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
