{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-07-08";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "37219d53284c9517f702742a051284f7dec7ee02";
    fetchSubmodules = true;
    sha256 = "sha256-cAfe30dKYjIyQd9aHPH372FivbqxL+zDAuH5W87kZzs=";
  });

  cargoSha256 = "sha256-kcXYJSf0xjl15mtnq8E2seumtBfTO//YVWzTEnaza6I=";

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
