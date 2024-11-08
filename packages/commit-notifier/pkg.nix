{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "75a91ae1c3d62c43bd3cd96d488f0475fd4c91cd";
    fetchSubmodules = true;
    sha256 = "sha256-iDi9Vx0nDOdImNFhfjyseASEz982oUl3l0BUO0Lra5U=";
  });

  cargoHash = "sha256-7WqJ2VqY4ntrCVxqtPUaKCM34U90quvAnWvZugB2Ow4=";

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
