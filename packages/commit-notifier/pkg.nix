{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-07";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "4f63141a5a80479d66f61e78c735bacae4fdc0a4";
    fetchSubmodules = true;
    sha256 = "sha256-6RY18ZelEKArOTFb+KV/9oeJFm5z/ZqK8S4fVlHPhdI=";
  });

  cargoSha256 = "sha256-l0qzvQSkZi0cEy5oMZh6nHJYqD9H5f+uGhkc3edw6zo=";

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
