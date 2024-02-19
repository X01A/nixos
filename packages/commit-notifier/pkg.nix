{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "e26b8ca671d0ee2366f233de0833dded86de1311";
    fetchSubmodules = true;
    sha256 = "sha256-/PB8539YCEogwPv1gx8brFsGfWqHUj672HOHDnM5JzE=";
  });

  cargoSha256 = "sha256-2hrHgfcBU6t85pe5joKC9MY4DvQW9xtsTO9e8y2qm7k=";

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
