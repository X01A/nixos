{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c4414cd9000159b9ab5fa434a0e5b561342d1f61";
    fetchSubmodules = true;
    sha256 = "sha256-sMivx4oOgbthQOxe4o0vMhgkBYvLXf72FKvrMCSWSCM=";
  });

  cargoHash = "sha256-faTXfnW3uAruWXgb4gL3X95SQAb28lVnf1ihsvA3INI=";

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
