{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-27";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "501e2b611628c8590998a938a97a4f884b1fb795";
    fetchSubmodules = true;
    sha256 = "sha256-JxtIEredAdxBTSF+PyB8UJTTBUKDuT+fveHc+IBRvnQ=";
  });

  cargoSha256 = "sha256-3sf/jYkDX4XH0sCJcA/fv5itwcIvB4X5nV02tAML8k0=";

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
