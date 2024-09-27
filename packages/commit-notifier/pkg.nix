{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-26";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "6b92a4da111a57fa43cb6a9d57b59b82e9233451";
    fetchSubmodules = true;
    sha256 = "sha256-sCYRs7tnfmmJ0pO8SW9kK4NsJD9zy/t8fgEFhFyow/A=";
  });

  cargoSha256 = "sha256-MVAoSvVaBBrAnJwy7aQceEvyS17CIj+wveuwR/2xhp8=";

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
