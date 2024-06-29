{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-28";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "fe8f6259d30ad4ea94bad35072f2fa79b6bd22ae";
    fetchSubmodules = true;
    sha256 = "sha256-izVH0H4o0sTSuT6LsapPydmJTr4vdnaUEaDMm39U6pE=";
  });

  cargoSha256 = "sha256-v7/h4klVvOC1maJAjaT9OTCr5wYfGAjnktjhQ4wlNyI=";

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
