{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "78e871644f91824dda32481fbbc2201ddc186809";
    fetchSubmodules = true;
    sha256 = "sha256-YiNJtIrRTQ9BDbkR6FYbB6vs9RSzsDjLs9bCzqIZwf4=";
  });

  cargoSha256 = "sha256-SkfdrUS47eLEPIOds+VgHvqNP3R5O66fJkGvV84kggQ=";

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
