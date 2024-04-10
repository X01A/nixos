{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "cc2bdc84cedbe04344bf5d070bb4dea1e78d7250";
    fetchSubmodules = true;
    sha256 = "sha256-vBZUeW46/lUcMPCaib/2oEhktvZPfq3O4XVofSR9N2Y=";
  });

  cargoSha256 = "sha256-YMZRwuMMtO9Dx4qOoazg2R0iPpncse5i0DWpsmixqW0=";

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
