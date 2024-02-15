{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-02-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "ab7c46b0c774369389d4c2d3a09a3980df6f5258";
    fetchSubmodules = true;
    sha256 = "sha256-ZpWsuPyIZiQ/KkQYqFWLMQF+v1BmxJ5MKajLrJ7vtXA=";
  });

  cargoSha256 = "sha256-EYOc/MNa2M8Fvtjaf2sRjSPFcfW7O4AUytlulaqc2tc=";

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
