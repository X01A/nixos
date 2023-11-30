{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "c8578ab051abc4ba9aa06c4a251f1642bd062bfd";
    fetchSubmodules = true;
    sha256 = "sha256-IfrG0pXSh/VLZ3SSB63j/VFGCcO91T0umFoIe1WFJI4=";
  });

  cargoSha256 = "sha256-zafSHm2xvPbbAo7vYiVtZ7rmwtrx7hMeQ81OnDyhUvw=";

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
