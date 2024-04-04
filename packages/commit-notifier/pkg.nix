{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "3941c7a95757727caf21237f0c5e7a4cda33dfbb";
    fetchSubmodules = true;
    sha256 = "sha256-XHpozM/z7f/X+IL0c1UdGehDITWlxVzGqYE/0hQKrNI=";
  });

  cargoSha256 = "sha256-nDLc9xu5XVP9f9XVPPCUQItW075quQVVIlR2VICPJG8=";

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
