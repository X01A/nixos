{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-10-20";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "8d36638b9271f8fb4cacfec367a10d8594bfb387";
    fetchSubmodules = true;
    sha256 = "sha256-slzPqDZ9G5/t39H1guAxL2Y7DkF4Tfe/dl8iHyeXyfA=";
  });

  cargoHash = "sha256-uM9Dk++Zg/xjN8QU0DUg8u3xYF/63r456LxooLfwV0Q=";

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
