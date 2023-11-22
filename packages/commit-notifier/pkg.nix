{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5a8f340e46bf16988fe4cbe0168e8fe529fbcb63";
    fetchSubmodules = true;
    sha256 = "sha256-TmMy1qOVuDMDjnoVawsTYaQfNiAVbYVCasgpBbsoAb0=";
  });

  cargoSha256 = "sha256-7dFP8bQiP2R4WHQKWtmOS0nT3pD7r3oI1jKroTy954Y=";

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
