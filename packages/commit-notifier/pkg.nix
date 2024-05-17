{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-17";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "a937dbd093cee5f3eb074aae0cc17dc1764fd3f6";
    fetchSubmodules = true;
    sha256 = "sha256-WYqwqXSHDLlt8Z0FnyFSmaTz5EVXA+yVbIg10QFuK8s=";
  });

  cargoSha256 = "sha256-IvDFAmlLwurP9CSBh4fNlHn2mrbFcJO8y+H9O8EJuk8=";

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
