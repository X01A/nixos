{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "bd74383845c2927c9a53353542814596db14aa4a";
    fetchSubmodules = true;
    sha256 = "sha256-VkWFYqWb+O851m1qK87ekTiYdAxrzfuLn5VeUxspTLA=";
  });

  cargoSha256 = "sha256-hZ45ifl25P85IYqnXj7dMMDfuECShvqL6wx+94G8mHc=";

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
