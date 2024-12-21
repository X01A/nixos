{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d59fe9db2e4bdbf680f1dc542ec171eb8a750dfa";
    fetchSubmodules = true;
    sha256 = "sha256-V4wV7+NkI1jOxC3rUkdd4FFPRgkxiNdLJqjlf/aNG00=";
  });

  cargoHash = "sha256-Q1nn+adW5nI3sd07t/LS14jSD7xOOuuW0N2aCqkgfH4=";

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
