{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-01-25";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "15efb010aa7dd1d1f03af0addcc2e6deb9827e8d";
    fetchSubmodules = true;
    sha256 = "sha256-oNLPeDQ77FzyVnuXTNkJvk0jgM+Zh9Bl4sXWoDSxbfY=";
  });

  cargoSha256 = "sha256-Rkm/xjSpFzg/7hKYnK5vcCYsgugizbo3DdVwsz+ozj0=";

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
