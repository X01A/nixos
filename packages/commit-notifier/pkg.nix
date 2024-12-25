{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f7766fce42a05fc1b55141d3b80032a5b409f379";
    fetchSubmodules = true;
    sha256 = "sha256-qY8VPUZG0eVm0xfkxuabhl69ITou22QdV3DjZGEuukc=";
  });

  cargoHash = "sha256-sRRba3HwK9wVAUgSHGMQKBsrY3TUtVTXn4Se/lwA+hM=";

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
