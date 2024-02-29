{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-29";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5f1160846017cb502042f9a1d4929812e685def5";
    fetchSubmodules = true;
    sha256 = "sha256-Lw/SjC3D3vapE2QrIuopADZRL7LtM8Y9DKq4kg3h0S4=";
  });

  cargoSha256 = "sha256-jLY010D2a2fOLZoOj6hZ9I1mFvB6oBr4gBJlQud46a0=";

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
