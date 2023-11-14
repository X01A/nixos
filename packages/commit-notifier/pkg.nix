{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "40b0db30d651494355c913b0d38bb3c4977e746b";
    fetchSubmodules = true;
    sha256 = "sha256-wx/kNnNLsg7gOqXn6b8RH0z9/UiZ4fI/1fnDf8AVACs=";
  });

  cargoSha256 = "sha256-DnaptbbPCAG3C8qraXARNYkZS2tmUX0oqjtDQha6aH0=";

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
