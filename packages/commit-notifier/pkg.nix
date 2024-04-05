{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "1573c2e81a4d8ddf4e5b5ef6fb285da9696d8e09";
    fetchSubmodules = true;
    sha256 = "sha256-80iCCFYd50B9VdlX0SAtsCF859tEwLicOywql3+z4Zk=";
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
