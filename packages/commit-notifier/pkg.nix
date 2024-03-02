{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-02";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "47ae97c8a633288c14dbdf5fcf98cf7cb19d38bf";
    fetchSubmodules = true;
    sha256 = "sha256-A/PoBD/Cm/sH/FPH66MNukBY3p6MgGz++HzYp8gD0Mg=";
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
