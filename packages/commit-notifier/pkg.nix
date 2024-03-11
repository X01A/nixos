{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2024-03-10";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "44a264133d2364bec801f7f3ddb8a2d82a67b138";
    fetchSubmodules = true;
    sha256 = "sha256-sdH64doL+NRd3F1xObYgS+i/CDdWMCpzw2wzjPiXTbU=";
  });

  cargoSha256 = "sha256-AS3GqJHek51fUiXz/pdFCk9qSahMt8tMS33QHZjkv1k=";

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
