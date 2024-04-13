{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-04-13";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "fb2871be21823b583ecafceb141eef73f1cf50fb";
    fetchSubmodules = true;
    sha256 = "sha256-gnYsTbppEiB9Tk9eUdmUWiwxtR6pwJwaLic768ayNx4=";
  });

  cargoSha256 = "sha256-QUlGzDP0RE4BquLDS1kSboAeV/BaHP6OC6hQ1big4/w=";

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
