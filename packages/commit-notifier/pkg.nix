{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "915202984a3cf158984794dca2b52f669671e8eb";
    fetchSubmodules = true;
    sha256 = "sha256-62TLI2yUVErDVMztamGrVcb8+zGZ73hZ3LlfhiNqxfM=";
  });

  cargoSha256 = "sha256-kbmGH+9WB5es7P9KcPHJcw2RgcmN797Qq8ZpBhaCElI=";

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
