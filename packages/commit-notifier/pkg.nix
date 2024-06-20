{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-19";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "9266e4e271ae48dde52287eec4eb4b6bcccdd34d";
    fetchSubmodules = true;
    sha256 = "sha256-1cqNe/Aqy2/QKxtEyCXx6LOLjvvkd7yLQCrKKHpM56A=";
  });

  cargoSha256 = "sha256-WpVEjklJ/lmQW3Og4JPoOo52cwg4iBz+Q4k1+KXefyE=";

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
