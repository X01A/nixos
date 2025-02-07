{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-02-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "59427553a0c0b182f6e42f58a396bc3734705569";
    fetchSubmodules = true;
    sha256 = "sha256-uTI0rOIcJplRCaB8GzTKZScBAO1Fst2JLoD165frATs=";
  });

  cargoHash = "sha256-r5g+3nsFvVvshIHkaB2rX155baIuePeYv6/eWXMDhCE=";

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
