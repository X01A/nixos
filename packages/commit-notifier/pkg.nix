{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2025-01-14";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "d9848d5f0d7679ab26e25641776d40d51bc7eca1";
    fetchSubmodules = true;
    sha256 = "sha256-79DALDrKprdFfldQ7fd0CoGy3TVgcO0Vpd/IjkmG7Cg=";
  });

  cargoHash = "sha256-C3zH1C3tH9LYuhqGXvnvK3kU4eJr8OmfyXfde2zLXRk=";

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
