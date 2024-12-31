{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-30";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "805146b4db91c1bd21c8abcb1a4340f449da705e";
    fetchSubmodules = true;
    sha256 = "sha256-6ncCi7AUrG7EVgiw3K6sP4cuJ8nH9ytvI1gzno0Kqf8=";
  });

  cargoHash = "sha256-9zmAmFkIEf2/HEQyqJm4wIHK2wz8wr3ELF4K+c8w02I=";

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
