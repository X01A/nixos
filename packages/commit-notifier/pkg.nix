{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "af1e3b184f6f1e030218bd806128ec0d218a9b51";
    fetchSubmodules = true;
    sha256 = "sha256-KNQmdJXGgXshbn8X0j2eUT0Cbg0pYz+1ZRoD1PV34U4=";
  });

  cargoSha256 = "sha256-LQB6Hzh3RiZaUXRweL2yGSYxLOCIza3V12hUHJvbD/s=";

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
