{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-11-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "729a686455f9f9826bfd7ef1f147bd415c8d29d0";
    fetchSubmodules = true;
    sha256 = "sha256-1DgmilXbeN3FCz4YRV79fIcOdkgJLyTAgHBR5G3Gh/U=";
  });

  cargoHash = "sha256-frS2bFreDKiwkE90jbUsD62Y/ikwIDMIRtykPgHyXKs=";

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
