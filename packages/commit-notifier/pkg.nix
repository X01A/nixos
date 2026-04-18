{
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  zlib,
  libgit2,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2026-04-18";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "353c846ca8ba912bda8c94e9a47337ccd83fc7eb";
    fetchSubmodules = true;
    sha256 = "sha256-xg5SfPH5C011zue1cfitDo3Vyf24AymVlxfyMQeX+ww=";
  });

  cargoHash = "sha256-3lG/eJ+X6cbUZirvEO9efEaEqwQWB63lohOcb1OR3X4=";

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
