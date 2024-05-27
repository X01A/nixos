{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-05-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "476fca1e77887aa57349f5bcbb2a684d5b81f8bc";
    fetchSubmodules = true;
    sha256 = "sha256-/zMIg/WN2G9qic/92nBm5TZFHjcnhGErTSKo83XaegE=";
  });

  cargoSha256 = "sha256-MYG9CYZfxyXReUZ80RH0TJw9NTsphA5NJcLwqv+FAww=";

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
