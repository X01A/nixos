{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-03-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ba277c02117d30bfc8ad040b10d423d4d29b3740";
    fetchSubmodules = true;
    sha256 = "sha256-6bfuzWJS7QQJNYeC6wyijdvdJmoExIgGXheVuXz/omE=";
  });

  cargoSha256 = "sha256-1v/2uibbEiMaNAcgxMMsFyiNYtXgDa49v9mpLdvSmio=";

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
