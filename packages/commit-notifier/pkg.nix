{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-11-23";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "f908a2b6f13306353cdadd8b3a7113b80d7cf1da";
    fetchSubmodules = true;
    sha256 = "sha256-THHEDJwqcEKDGfCSByiVmcDPAIKCqtQAZ0cWWN4I9n4=";
  });

  cargoSha256 = "sha256-IeR0DFRtL52lfFw0ALrkzRukZQaU3iON6O/Xy4NnuPs=";

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
