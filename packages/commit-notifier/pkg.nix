{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-09-06";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f16a3f2e7e9c101a698df7860e0ea443bad33a7e";
    fetchSubmodules = true;
    sha256 = "sha256-WPYPDmiTU2yuqLTbRn4NJCaFP/QqZNga9a7KL0xL7Tc=";
  });

  cargoSha256 = "sha256-YMP6ImwQ0dTz6AXe6emWcq05RMJw4tsi3ecNOqU73jw=";

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
