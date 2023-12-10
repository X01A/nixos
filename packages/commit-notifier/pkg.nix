{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "2f37adab1448e1f6a556476e79d62d2b762dfc7d";
    fetchSubmodules = true;
    sha256 = "sha256-STrMNzuz3f4+qlmrenyVK2gW+nP0qKmJHYsLe2vF/so=";
  });

  cargoSha256 = "sha256-dHyLvkdl7B+3uxQkL5pZaXUaXxHeaY98jTSm/2cIEto=";

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
