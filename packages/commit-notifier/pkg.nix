{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-03-28";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "feff49bb9ac7cf692109321cf4ba07024329c7c2";
    fetchSubmodules = true;
    sha256 = "sha256-j+uAxE+3k3d3H+XRqBlV0e9LV4ls/XQrn7+C2ev2F80=";
  });

  cargoSha256 = "sha256-FpkAq6lv8JGDqt+7OEdY9gWdSOHVuxOPUz3ogN2ZHL4=";

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
